// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct SimpleCommitStatus: Codable {
    public var description: String?
    public var id: Int
    public var nodeID: String
    public var state: String
    public var context: String
    public var targetURL: URL
    public var isRequired: Bool?
    public var avatarURL: URL?
    public var url: URL
    public var createdAt: Date
    public var updatedAt: Date

    public init(description: String? = nil, id: Int, nodeID: String, state: String, context: String, targetURL: URL, isRequired: Bool? = nil, avatarURL: URL? = nil, url: URL, createdAt: Date, updatedAt: Date) {
        self.description = description
        self.id = id
        self.nodeID = nodeID
        self.state = state
        self.context = context
        self.targetURL = targetURL
        self.isRequired = isRequired
        self.avatarURL = avatarURL
        self.url = url
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.state = try values.decode(String.self, forKey: "state")
        self.context = try values.decode(String.self, forKey: "context")
        self.targetURL = try values.decode(URL.self, forKey: "target_url")
        self.isRequired = try values.decodeIfPresent(Bool.self, forKey: "required")
        self.avatarURL = try values.decodeIfPresent(URL.self, forKey: "avatar_url")
        self.url = try values.decode(URL.self, forKey: "url")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(description, forKey: "description")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(state, forKey: "state")
        try values.encode(context, forKey: "context")
        try values.encode(targetURL, forKey: "target_url")
        try values.encodeIfPresent(isRequired, forKey: "required")
        try values.encodeIfPresent(avatarURL, forKey: "avatar_url")
        try values.encode(url, forKey: "url")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
    }
}
