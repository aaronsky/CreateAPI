// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// A pet title
///
/// A pet description
public struct Pet: Codable {
    public var id: Int64
    /// Example: "Buddy"
    public var name: String
    public var tag: String?

    public init(id: Int64, name: String, tag: String? = nil) {
        self.id = id
        self.name = name
        self.tag = tag
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encodeIfPresent(tag, forKey: "tag")
    }
}
