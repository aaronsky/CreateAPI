// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Pet: Codable {
    public var id: Int64?
    public var category: Category?
    /// Example: "doggie"
    public var name: String
    public var photoUrls: [String]
    public var tags: [Tag]?
    /// Pet status in the store
    public var status: Status?

    /// Pet status in the store
    public enum Status: String, CaseIterable, Codable {
        case available
        case pending
        case sold
    }

    public init(id: Int64? = nil, category: Category? = nil, name: String, photoUrls: [String], tags: [Tag]? = nil, status: Status? = nil) {
        self.id = id
        self.category = category
        self.name = name
        self.photoUrls = photoUrls
        self.tags = tags
        self.status = status
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int64.self, forKey: "id")
        self.category = try values.decodeIfPresent(Category.self, forKey: "category")
        self.name = try values.decode(String.self, forKey: "name")
        self.photoUrls = try values.decode([String].self, forKey: "photoUrls")
        self.tags = try values.decodeIfPresent([Tag].self, forKey: "tags")
        self.status = try values.decodeIfPresent(Status.self, forKey: "status")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(category, forKey: "category")
        try values.encode(name, forKey: "name")
        try values.encode(photoUrls, forKey: "photoUrls")
        try values.encodeIfPresent(tags, forKey: "tags")
        try values.encodeIfPresent(status, forKey: "status")
    }
}
