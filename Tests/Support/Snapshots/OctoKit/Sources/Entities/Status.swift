// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// The status of a commit.
public struct Status: Codable {
    public var url: String
    public var avatarURL: String?
    public var id: Int
    public var nodeID: String
    public var state: String
    public var description: String
    public var targetURL: String
    public var context: String
    public var createdAt: String
    public var updatedAt: String
    /// Simple User
    public var creator: SimpleUser?

    public init(url: String, avatarURL: String? = nil, id: Int, nodeID: String, state: String, description: String, targetURL: String, context: String, createdAt: String, updatedAt: String, creator: SimpleUser? = nil) {
        self.url = url
        self.avatarURL = avatarURL
        self.id = id
        self.nodeID = nodeID
        self.state = state
        self.description = description
        self.targetURL = targetURL
        self.context = context
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.creator = creator
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(String.self, forKey: "url")
        self.avatarURL = try values.decodeIfPresent(String.self, forKey: "avatar_url")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.state = try values.decode(String.self, forKey: "state")
        self.description = try values.decode(String.self, forKey: "description")
        self.targetURL = try values.decode(String.self, forKey: "target_url")
        self.context = try values.decode(String.self, forKey: "context")
        self.createdAt = try values.decode(String.self, forKey: "created_at")
        self.updatedAt = try values.decode(String.self, forKey: "updated_at")
        self.creator = try values.decodeIfPresent(SimpleUser.self, forKey: "creator")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encodeIfPresent(avatarURL, forKey: "avatar_url")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(state, forKey: "state")
        try values.encode(description, forKey: "description")
        try values.encode(targetURL, forKey: "target_url")
        try values.encode(context, forKey: "context")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encodeIfPresent(creator, forKey: "creator")
    }
}
