// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ContainerA: Codable {
    public var child: Child?
    public var refChild: AnyJSON

    public struct Child: Codable {
        public var `enum`: Enum
        public var renameMe: String
        public var child: Child

        public enum Enum: String, CaseIterable, Codable {
            case a
            case b
        }

        public struct Child: Codable {
            public var `enum`: Enum
            public var onlyItRenamed: String

            public enum Enum: String, CaseIterable, Codable {
                case a
                case b
            }

            public init(`enum`: Enum, onlyItRenamed: String) {
                self.enum = `enum`
                self.onlyItRenamed = onlyItRenamed
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.enum = try values.decode(Enum.self, forKey: "enum")
                self.onlyItRenamed = try values.decode(String.self, forKey: "rename-me")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(`enum`, forKey: "enum")
                try values.encode(onlyItRenamed, forKey: "rename-me")
            }
        }

        public init(`enum`: Enum, renameMe: String, child: Child) {
            self.enum = `enum`
            self.renameMe = renameMe
            self.child = child
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.enum = try values.decode(Enum.self, forKey: "enum")
            self.renameMe = try values.decode(String.self, forKey: "rename-me")
            self.child = try values.decode(Child.self, forKey: "child")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(`enum`, forKey: "enum")
            try values.encode(renameMe, forKey: "rename-me")
            try values.encode(child, forKey: "child")
        }
    }

    public init(child: Child? = nil, refChild: AnyJSON) {
        self.child = child
        self.refChild = refChild
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.child = try values.decodeIfPresent(Child.self, forKey: "child")
        self.refChild = try values.decode(AnyJSON.self, forKey: "refChild")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(child, forKey: "child")
        try values.encode(refChild, forKey: "refChild")
    }
}
