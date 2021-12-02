// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import OpenAPIKit30
import Foundation

// TODO: mappedPropertyNames and mappedTypeNames to work with nested names: "A.B.C"
// TODO: Add an option to inline all properties on allOf from referenes (dereference)
// TODO: Add not support and fix warnings
// TODO: Add File (Data) support (see FormatTest.date)
// TODO: Add Date(Day) support (NaiveDate?) (see FormatTest.date)
// TODO: Add UUID support (and test it!)
// TODO: Review OpenAPI spec for -all
// TODO: Add int32/int64 support (optional) (and a way to disable)
// TODO: Check why public struct ConfigItem: Decodable { is empty
// TODO: Get rid of typealiases where a custom type is generated public typealias SearchResultTextMatches = [SearchResultTextMatchesItem]
// TODO: Final imporvementes to OctoKit
// TODO: anyOf should be class or struct?

// TODO: Add Encodable support
// TODO: Test remaining String formats https://swagger.io/docs/specification/data-models/data-types/ AND add options to disable some of tem
// TODO: More concise examples if it's just array of plain types
// TODO: Add an option to use CodingKeys instead of custom init
// TODO: Option to just use automatic CodingKeys (if you backend is perfect)
// TODO: Add an option to generate an initializer
// TODO: See what needs to be fixed in petstore-all
// TODO: Add support for default values
// TODO: Option to disable custom key generation
// TODO: Add support for deprecated fields
// TODO: Better naming for inline/nested objects
// TODO: Print more in verbose mode
// TODO: Add warnings for unsupported features
// TODO: Add Linux support
// TODO: Add SwiftLint disable all
// TODO: Remove remainig dereferencing
// TODO: Add JSON tests
// TODO: Add OpenAPI 3.1 support
// TODO: Autocapitilize description/title
// TODO: Add an option to ignore errors in arrays
// TODO: Rename to GenerateEntities
// TODO: Add an option to set a custom header

// TODO: Add an obeserver for a file (and keep tool running)

// TODO: Separate mapped* dictionary for enums
// TODO: entitiesGeneratedAsClasses - add support for nesting
// TODO: Add an option how allOf is generated (inline properties, craete protocols)

final class GenerateSchemas {
    private let spec: OpenAPI.Document
    private let options: GenerateOptions
    private let arguments: GenerateArguments
    
    var access: String { options.access.map { "\($0) " } ?? "" }
    var protocols: String { options.schemes.adoptedProtocols.joined(separator: ", ") }

    private let templates: Templates
    private var isAnyJSONUsed = false
    private let lock = NSLock()
    
    init(spec: OpenAPI.Document, options: GenerateOptions, arguments: GenerateArguments) {
        self.spec = spec
        self.options = options
        self.arguments = arguments
        self.templates = Templates(options: options)
    }

    func run() -> String {
        var output = templates.fileHeader
        output += "\n\n"
        
        let startTime = CFAbsoluteTimeGetCurrent()
        if arguments.isVerbose {
            print("Start generating schemas (\(spec.components.schemas.count))")
        }
        
        let schemas = Array(spec.components.schemas)
        var generated = Array<String?>(repeating: nil, count: schemas.count)
        let lock = NSLock()
        concurrentPerform(on: schemas, parallel: arguments.isParallel) { index, item in
            let (key, schema) = schemas[index]
            
            guard let name = makeTypeNameFor(key: key, schema: schema) else {
                if arguments.isVerbose {
                    print("Skipping generation for \(key.rawValue)")
                }
                return
            }
                        
            do {
                if let entry = try makeParent(name: name, schema: schema), !entry.isEmpty {
                    lock.lock()
                    generated[index] = entry
                    lock.unlock()
                }
            } catch {
                print("ERROR: Failed to generate entity for \(key.rawValue): \(error)")
            }
        }

        for entry in generated where entry != nil {
            output += entry!
            output += "\n\n"
        }
        
        if isAnyJSONUsed {
            output += "\n"
            output += anyJSON
            output += "\n"
        }

        output += stringCodingKey
        output += "\n"
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        if arguments.isVerbose {
            print("Generated schemas in \(timeElapsed) s.")
        }
        
        return output
    }
    
    // Recursively creates a type: `struct`, `class`, `enum` – depending on the
    // schema and the user options. Primitive types often used in specs to reuse
    // documentation are inlined.
    private func makeParent(name: TypeName, schema: JSONSchema) throws -> String? {
        switch schema {
        case .boolean, .number, .integer:
            return nil // Inline
        case .string(let coreContext, _):
            if isEnum(coreContext) {
                return try makeEnum(name: name, coreContext: coreContext)
            }
            return nil // Inline 'String'
        case .object(let coreContext, let objectContext):
            return try makeObject(name: name, coreContext, objectContext)
        case .array(let coreContext, let arrayContext):
            return try makeTypealiasArray(name, coreContext, arrayContext)
        case .all(let of, _):
            return try makeAllOf(name: name, schemas: of)
        case .one(let of, _):
            return try makeOneOf(name: name, of)
        case .any(let of, _):
            return try makeAnyOf(name: name, of)
        case .not:
            throw GeneratorError("`not` is not supported: \(name)")
        case .reference:
            return nil // Can't appear in this context
        case .fragment:
            return nil // Can't appear in this context
        }
    }
    
    
    /// Return `nil` to skip generation.
    private func makeTypeNameFor(key: OpenAPI.ComponentKey, schema: JSONSchema) -> TypeName? {
        if arguments.vendor == "github" {
            if key.rawValue.hasPrefix("nullable-") {
                let counterpart = key.rawValue.replacingOccurrences(of: "nullable-", with: "")
                if let counterpartKey = OpenAPI.ComponentKey(rawValue: counterpart),
                   spec.components.schemas[counterpartKey] != nil {
                    return nil
                } else {
                    // Some types in GitHub specs are only defined once as Nullable
                    return makeTypeName(counterpart)
                }
            }
        }
        let name = makeTypeName(key.rawValue)
        if !options.schemes.mappedTypeNames.isEmpty {
            if let mapped = options.schemes.mappedTypeNames[name.rawValue] {
                return TypeName(processedRawValue: mapped)
            }
        }
        return makeTypeName(key.rawValue)
    }
        
    private struct PropertyContainer {
        let name: TypeName
    }
    
    private struct Property {
        // Example: "files"
        let name: PropertyName
        // Example: "[File]"
        let type: String
        let isOptional: Bool
        // Key in the JSON
        let key: String

        let schema: JSONSchema
        let context: JSONSchemaContext?
        var nested: String?
    }
                
    private func makeProperty(key: String, schema: JSONSchema, isRequired: Bool, in container: PropertyContainer) throws -> Property {
        func makeChildPropertyName(for name: PropertyName, type: String) -> PropertyName {
            if !options.schemes.mappedPropertyNames.isEmpty {
                if let mapped = options.schemes.mappedPropertyNames[name.rawValue] {
                    return PropertyName(processedRawValue: mapped)
                }
                if let mapped = options.schemes.mappedPropertyNames["\(container.name).\(name)"] {
                    return PropertyName(processedRawValue: mapped)
                }
            }
            if options.isGeneratingSwiftyBooleanPropertyNames && type == "Bool" {
                return name.asBoolean()
            }
            return name
        }
        
        func child(name: PropertyName, type: String, context: JSONSchemaContext?, nested: String? = nil) -> Property {
            assert(context != nil) // context is null for references, but the caller needs to dereference first
            let nullable = context?.nullable ?? true
            let name = makeChildPropertyName(for: name, type: type)
            return Property(name: name, type: type, isOptional: !isRequired || nullable, key: key, schema: schema, context: context, nested: nested)
        }

        let propertyName = makePropertyName(key)
   
        switch schema {
        case .object(let coreContext, let objectContext):
            if objectContext.properties.isEmpty, let additional = objectContext.additionalProperties {
                switch additional {
                case .a:
                    return child(name: propertyName, type: "[String: AnyJSON]", context: coreContext)
                case .b(let schema):
                    // TODO: Do this recursively, but for now two levels will suffice (map of map)
                    if case .object(let coreContext, let objectContext) = schema,
                       objectContext.properties.isEmpty,
                       let additional = objectContext.additionalProperties {
                        switch additional {
                        case .a:
                            return child(name: propertyName, type: "[String: [String: AnyJSON]]", context: coreContext)
                        case .b(let schema):
                            if let type = try? getPrimitiveType(for: schema) {
                                return child(name: propertyName, type: "[String: [String: \(type)]]", context: coreContext, nested: nil)
                            }
                            let nestedTypeName = makeTypeName(key).appending("Item")
                            let nested = try makeParent(name: nestedTypeName, schema: schema)
                            return child(name: propertyName, type: "[String: [String: \(nestedTypeName)]]", context: coreContext, nested: nested)
                        }
                    }
                    if let type = try? getPrimitiveType(for: schema) {
                        return child(name: propertyName, type: "[String: \(type)]", context: coreContext, nested: nil)
                    }
                    let nestedTypeName = makeTypeName(key).appending("Item")
                    // TODO: implement shiftRight (fix nested enums)
                    let nested = try makeParent(name: nestedTypeName, schema: schema)
                    return child(name: propertyName, type: "[String: \(nestedTypeName)]", context: coreContext, nested: nested)
                }
            }
            let type = makeTypeName(key)
            let nested = try makeParent(name: type, schema: schema)
            return child(name: propertyName, type: type.rawValue, context: coreContext, nested: nested)
        case .array(let coreContext, let arrayContext):
            guard let item = arrayContext.items else {
                throw GeneratorError("Missing array item type")
            }
            if let type = try? getPrimitiveType(for: item) {
                return child(name: propertyName, type: "[\(type)]", context: coreContext)
            }
            let name = makeTypeName(key).appending("Item")
            let nested = try makeParent(name: name, schema: item)
            return child(name: propertyName, type: "[\(name)]", context: coreContext, nested: nested)
        case .string(let coreContext, _):
            if isEnum(coreContext) {
                let typeName = makeTypeName(makeChildPropertyName(for: propertyName, type: "CreateAPIEnumPlaceholderName").rawValue)
                let nested = try makeEnum(name: typeName, coreContext: coreContext)
                return child(name: propertyName, type: typeName.rawValue, context: schema.coreContext, nested: nested)
            }
            let type = try getPrimitiveType(for: schema)
            return child(name: propertyName, type: type, context: coreContext)
        case .all, .one, .any:
            let name = makeTypeName(key)
            let nested = try makeParent(name: name, schema: schema)
            return child(name: propertyName, type: name.rawValue, context: schema.coreContext, nested: nested)
        case .not(let jSONSchema, let core):
            throw GeneratorError("`not` properties are not supported")
        default:
            var context: JSONSchemaContext?
            switch schema {
                // TODO: rewrite
            case .reference(let ref, _):
                let deref = try ref.dereferenced(in: spec.components)
                context = deref.coreContext
            default:
                context = schema.coreContext
            }
            let type = try getPrimitiveType(for: schema)
            return child(name: propertyName, type: type, context: context)
        }
    }
    
    private func makeNested(for children: [Property]) -> String? {
        let nested = children.compactMap({ $0.nested?.shiftedRight(count: 4) })
        guard !nested.isEmpty else { return nil }
        return nested.joined(separator: "\n\n")
    }
    
    // MARK: Object
    
    private func makeObject(name: TypeName, _ coreContext: JSONSchema.CoreContext<JSONTypeFormat.ObjectFormat>, _ objectContext: JSONSchema.ObjectContext) throws -> String {
        var output = ""

        output += templates.comments(for: coreContext)
        output += makeEntityDeclaration(name: name)

        // Generate properties
        let keys = objectContext.properties.keys.sorted()
        var properties: [String: Property] = [:]
        var skippedKeys = Set<String>()
        let container = PropertyContainer(name: name)
        for key in keys {
            let schema = objectContext.properties[key]!
            let isRequired = objectContext.requiredProperties.contains(key)
            do {
                properties[key] = try makeProperty(key: key, schema: schema, isRequired: isRequired, in: container)
            } catch {
                skippedKeys.insert(key)
                print("ERROR: Failed to generate property \(error)")
            }
        }
        
        // TODO: Find a way to preserve the order of keys
        var nested: [String] = []
        for key in keys {
            guard let property = properties[key] else { continue }
            output += makeProperty(for: property).shiftedRight(count: 4)
            if let object = property.nested {
                nested.append(object)
            }
            output += "\n"
        }

        // Add nested types
        for nested in nested {
            output += "\n"
            output += nested.shiftedRight(count: 4)
            output += "\n"
        }
        
        // Generate initializer
        if !properties.isEmpty && options.schemes.isGeneratingInitWithCoder {
            output += "\n"
            output += "    \(access)init(from decoder: Decoder) throws {\n"
            output += "        let values = try decoder.container(keyedBy: StringCodingKey.self)\n"
            for key in keys {
                guard let property = properties[key] else { continue }
                let decode = property.isOptional ? "decodeIfPresent" : "decode"
                output += "        self.\(property.name.accessor) = try values.\(decode)(\(property.type).self, forKey: \"\(key)\")"
                output += "\n"
            }
            output += "    }\n"
        }
        
        
        // TODO: Add this an an options
//        let hasCustomCodingKeys = keys.contains { PropertyName($0).rawValue != $0 }
//        if hasCustomCodingKeys {
//            output += "\n"
//            output += "    private enum CodingKeys: String, CodingKey {\n"
//            for key in keys where !skippedKeys.contains(key) {
//                let parameter = PropertyName(key).rawValue
//                if parameter == key {
//                    output += "        case \(parameter)\n"
//                } else {
//                    output += "        case \(parameter) = \"\(key)\"\n"
//                }
//            }
//            output +=  "    }\n"
//        }
        
        output += "}"
        return output
    }
    
    // E.g. "public final class User: Codable {\n"
    private func makeEntityDeclaration(name: TypeName) -> String {
        let isStruct = (options.schemes.isGeneratingStructs && !options.schemes.entitiesGeneratedAsClasses.contains(name.rawValue)) || (options.schemes.entitiesGeneratedAsStructs.contains(name.rawValue))
        let lhs = [options.access, (isStruct ? "struct" : "final class"), name.rawValue]
            .compactMap { $0 }.joined(separator: " ")
        let rhs = ([isStruct ? nil : options.schemes.baseClass] + options.schemes.adoptedProtocols)
            .compactMap { $0 }.joined(separator: ", ")
        return "\(lhs): \(rhs) {\n"
    }
    
    // Example: "public var files: [Files]?"
    private func makeProperty(for child: Property) -> String {
        var output = ""
        if let context = child.context {
            output += templates.comments(for: context)
        }
        output += "\(access)var \(child.name): \(child.type)\(child.isOptional ? "?" : "")"
        return output
    }
    
    // MARK: Typealiases
            
    private func makeTypealiasArray(_ name: TypeName, _ coreContext: JSONSchema.CoreContext<JSONTypeFormat.ArrayFormat>, _ arrayContext: JSONSchema.ArrayContext) throws -> String {
        guard let item = arrayContext.items else {
            throw GeneratorError("Missing array item type")
        }
        if let type = try? getPrimitiveType(for: item) {
            guard !options.isInliningPrimitiveTypes else {
                return ""
            }
            return "\(access)typealias \(name) = [\(type)]"
        }
        // Requres generation of a separate type
        var output = ""
        let itemName = name.appending("Item")
        output += "\(access)typealias \(name) = [\(itemName)]\n\n"
        output += (try makeParent(name: itemName, schema: item)) ?? ""
        return output
    }
    
    // MARK: Enums
    
    private func makeEnum(name: TypeName, coreContext: JSONSchemaContext) throws -> String {
        let values = (coreContext.allowedValues ?? [])
            .compactMap { $0.value as? String }
        guard !values.isEmpty else {
            throw GeneratorError("Enum \(name) has no values")
        }
        
        var output = ""
        output += templates.comments(for: coreContext)
        output += "\(access)enum \(name): String, Codable, CaseIterable {\n"
        let escaped = CharacterSet(charactersIn: "`")
        for value in values {
            let caseName = makePropertyName(value).rawValue
            if caseName.trimmingCharacters(in: escaped) != value {
                output += "    case \(caseName) = \"\(value)\"\n"
            } else {
                output += "    case \(caseName)\n"
            }
        }
        output += "}"
        return output
    }
    
    private func isInlinable(_ schema: JSONSchema) -> Bool {
        switch schema {
        case .boolean: return true
        case .number: return true
        case .integer: return true
        case .string(let coreContext, _):
            return !isEnum(coreContext)
        case .object: return false
        case .array(_, let arrayContext):
            if let item = arrayContext.items {
                return (try? getPrimitiveType(for: item)) != nil
            }
            return false
        case .all: return false
        case .one: return false
        case .any: return false
        case .not: return false
        case .reference: return false
        case .fragment: return false
        }
    }
    
    private func isEnum(_ coreContext: JSONSchema.CoreContext<JSONTypeFormat.StringFormat>) -> Bool {
        options.isGeneratingEnums && coreContext.allowedValues != nil
    }
    
    // MARK: Misc
    
    // Anything that's not an object or a reference.
    private func getPrimitiveType(for json: JSONSchema) throws -> String {
        switch json {
        case .boolean: return "Bool"
        case .number: return "Double"
        case .integer: return "Int"
        case .string(let coreContext, _):
            if isEnum(coreContext) {
                throw GeneratorError("Enum isn't a primitive type")
            }
            switch coreContext.format {
            case .dateTime:
                return "Date"
            case .other(let other):
                if other == "uri" {
                    return "URL"
                }
            default: break
            }
            return "String"
        case .object(let coreContext, _):
            throw GeneratorError("`object` is not supported: \(coreContext)")
        case .array(_, let arrayContext):
            guard let items = arrayContext.items else {
                throw GeneratorError("Missing array item type")
            }
            return "[\(try getPrimitiveType(for: items))]"
        case .all(let of, _):
            throw GeneratorError("`allOf` is not supported: \(of)")
        case .one(let of, _):
            throw GeneratorError("`oneOf` is not supported: \(of)")
        case .any(let of, _):
            throw GeneratorError("`anyOf` is not supported: \(of)")
        case .not(let scheme, _):
            throw GeneratorError("`not` is not supported: \(scheme)")
        case .reference(let reference, _):
            switch reference {
            case .internal(let ref):
                if arguments.vendor == "github", let name = ref.name, name.hasPrefix("nullable-") {
                    return makeTypeName(name.replacingOccurrences(of: "nullable-", with: "")).rawValue
                }
                // Note: while dereferencing, it does it recursively.
                // So if you have `typealias Pets = [Pet]`, it'll dereference
                // `Pet` to an `.object`, not a `.reference`.
                if options.isInliningPrimitiveTypes,
                   let key = OpenAPI.ComponentKey(rawValue: ref.name ?? ""),
                   let scheme = spec.components.schemas[key],
                    let type = try? getPrimitiveType(for: scheme),
                    isInlinable(scheme) {
                    return type // Inline simple types
                }
                guard let name = ref.name else {
                    throw GeneratorError("Internal reference name is missing: \(ref)")
                }
                // TODO: Remove duplication
                if !options.schemes.mappedTypeNames.isEmpty {
                    if let mapped = options.schemes.mappedTypeNames[name] {
                        return mapped
                    }
                }
                return makeTypeName(name).rawValue
            case .external(let url):
                throw GeneratorError("External references are not supported: \(url)")
            }
        case .fragment:
            setAnyJsonNeeded()
            return "AnyJSON"
        }
    }
        
    // MARK: oneOf/anyOf/allOf
    
    // TODO: Special-case double/string?
    private func makeOneOf(name: TypeName, _ schemas: [JSONSchema]) throws -> String {
        let types = makeTypeNames(for: schemas)
        let container = PropertyContainer(name: name)
        let children: [Property] = try zip(types, schemas).map { type, schema in
            try makeProperty(key: type, schema: schema, isRequired: true, in: container)
        }
        
        var output = "\(access)enum \(name): \(protocols) {\n"
        for child in children {
            output += "    case \(child.name)(\(child.type))\n"
        }
        output += "\n"
        
        func makeInitFromDecoder() throws -> String {
            var output = """
            \(access)init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()\n
            """
            output += "    "
            
            for child in children {
                output += """
                if let value = try? container.decode(\(child.type).self) {
                        self = .\(child.name)(value)
                    } else
                """
                output += " "
            }
            output += """
            {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to intialize \(name)")
                }
            }
            """
            return output
        }
        
        output += try makeInitFromDecoder().shiftedRight(count: 4)
        
        if let nested = makeNested(for: children) {
            output += "\n\n"
            output += nested
        }

        output += "\n}"
        return output
    }
        
    private func makeAnyOf(name: TypeName, _ schemas: [JSONSchema]) throws -> String {
        let types = makeTypeNames(for: schemas)
        let container = PropertyContainer(name: name)
        let children: [Property] = try zip(types, schemas).map { type, schema in
            try makeProperty(key: type, schema: schema, isRequired: true, in: container)
        }
        
        var output = "\(access)struct \(name): \(protocols) {\n"
        
        for child in children {
            output += "    \(access)var \(child.name): \(child.type)?\n"
        }
        output += "\n"
    
        func makeInitFromDecoder() throws -> String {
            var output = """
            \(access)init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()\n
            """
            
            for child in children {
                output += "    self.\(child.name) = try? container.decode(\(child.type).self)\n"
            }
            output += "}"
            return output
        }
        
        output += try makeInitFromDecoder().shiftedRight(count: 4)
        
        
        if let nested = makeNested(for: children) {
            output += "\n\n"
            output += nested
        }
        
        output += "\n}"
        return output
    }
    
    private func makeAllOf(name: TypeName, schemas: [JSONSchema]) throws -> String {
        let types = makeTypeNames(for: schemas)
        let container = PropertyContainer(name: name)
        let properties: [Property] = try zip(types, schemas).flatMap { type, schema -> [Property] in
            switch schema {
            case .object(_, let objectContext):
                // Inline properties for nested objects (differnt from other OpenAPI constructs)
                // TODO: refactor
                return try objectContext.properties.keys.sorted().map { key in
                    let schema = objectContext.properties[key]!
                    let isRequired = objectContext.requiredProperties.contains(key)
                    return try makeProperty(key: key, schema: schema, isRequired: isRequired, in: container)
                }
            default:
                return [try makeProperty(key: type, schema: schema, isRequired: true, in: container)]
            }
        }
        
        var output = makeEntityDeclaration(name: name)
        for property in properties {
            output += "    \(access)var \(property.name): \(property.type)\n"
        }
        output += "\n"
        
        func makeInitFromDecoder() throws -> String {
            var output = "\(access)init(from decoder: Decoder) throws {\n"
            output += "    let values = try decoder.container(keyedBy: StringCodingKey.self)\n"
            for property in properties {
                switch property.schema {
                case .reference:
                    output += "    self.\(property.name.accessor) = try \(property.type)(from: decoder)"
                default:
                    let decode = property.isOptional ? "decodeIfPresent" : "decode"
                    output += "    self.\(property.name.accessor) = try values.\(decode)(\(property.type).self, forKey: \"\(property.key)\")"
                }
                output += "\n"
            }
            output += "}\n"
            return output
        }
        
        output += try makeInitFromDecoder().shiftedRight(count: 4)
         
        if let nested = makeNested(for: properties) {
            output += "\n\n"
            output += nested
        }
        
        output += "\n}"
        return output
    }
        
    private func makeTypeNames(for schemas: [JSONSchema]) -> [String] {
        var types = Array<String?>(repeating: nil, count: schemas.count)
        
        // Assign known types (references, primitive)
        for (index, schema) in schemas.enumerated() {
            types[index] = try? getPrimitiveType(for: schema)
        }
        
        // Generate names for anonymous nested objects
        let unnamedCount = types.filter { $0 == nil }.count
        var genericCount = 1
        func makeNextGenericName() -> String {
            defer { genericCount += 1 }
            return "Object\((unnamedCount == 1 && genericCount == 1) ? "" : "\(genericCount)")"
        }
        for (index, _) in schemas.enumerated() {
            if types[index] == nil {
                types[index] = makeNextGenericName()
            }
        }
        
        // Disambiguate arrays
        func parameter(for type: String) -> String {
            let isArray = type.starts(with: "[") // TODO: Refactor
            return "\(makePropertyName(type))\(isArray ? "s" : "")"
        }
        return types.map { parameter(for: $0!) }
    }
    
    func setAnyJsonNeeded() {
        lock.lock()
        isAnyJSONUsed = true
        lock.unlock()
    }
    
    private func makePropertyName(_ rawValue: String) -> PropertyName {
        PropertyName(rawValue, options: options)
    }
    
    private func makeTypeName(_ rawValue: String) -> TypeName {
        TypeName(rawValue, options: options)
    }
}

struct GeneratorError: Error, LocalizedError {
    let message: String

    init(_ message: String) {
        self.message = message
    }
    
    var errorDescription: String? {
        message
    }
}
