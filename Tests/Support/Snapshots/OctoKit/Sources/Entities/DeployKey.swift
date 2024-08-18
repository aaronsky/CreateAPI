// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// An SSH key granting access to a single repository.
public struct DeployKey: Codable {
    public var id: Int
    public var key: String
    public var url: String
    public var title: String
    public var isVerified: Bool
    public var createdAt: String
    public var isReadOnly: Bool

    public init(id: Int, key: String, url: String, title: String, isVerified: Bool, createdAt: String, isReadOnly: Bool) {
        self.id = id
        self.key = key
        self.url = url
        self.title = title
        self.isVerified = isVerified
        self.createdAt = createdAt
        self.isReadOnly = isReadOnly
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.key = try values.decode(String.self, forKey: "key")
        self.url = try values.decode(String.self, forKey: "url")
        self.title = try values.decode(String.self, forKey: "title")
        self.isVerified = try values.decode(Bool.self, forKey: "verified")
        self.createdAt = try values.decode(String.self, forKey: "created_at")
        self.isReadOnly = try values.decode(Bool.self, forKey: "read_only")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(key, forKey: "key")
        try values.encode(url, forKey: "url")
        try values.encode(title, forKey: "title")
        try values.encode(isVerified, forKey: "verified")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(isReadOnly, forKey: "read_only")
    }
}
