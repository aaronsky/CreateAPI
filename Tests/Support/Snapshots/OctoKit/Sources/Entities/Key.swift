// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Key: Codable {
    public var key: String
    public var id: Int
    public var url: String
    public var title: String
    public var createdAt: Date
    public var isVerified: Bool
    public var isReadOnly: Bool

    public init(key: String, id: Int, url: String, title: String, createdAt: Date, isVerified: Bool, isReadOnly: Bool) {
        self.key = key
        self.id = id
        self.url = url
        self.title = title
        self.createdAt = createdAt
        self.isVerified = isVerified
        self.isReadOnly = isReadOnly
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.key = try values.decode(String.self, forKey: "key")
        self.id = try values.decode(Int.self, forKey: "id")
        self.url = try values.decode(String.self, forKey: "url")
        self.title = try values.decode(String.self, forKey: "title")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.isVerified = try values.decode(Bool.self, forKey: "verified")
        self.isReadOnly = try values.decode(Bool.self, forKey: "read_only")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(key, forKey: "key")
        try values.encode(id, forKey: "id")
        try values.encode(url, forKey: "url")
        try values.encode(title, forKey: "title")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(isVerified, forKey: "verified")
        try values.encode(isReadOnly, forKey: "read_only")
    }
}
