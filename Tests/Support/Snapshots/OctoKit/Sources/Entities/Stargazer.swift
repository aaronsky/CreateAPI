// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Stargazer: Codable {
    public var starredAt: Date
    /// Simple User
    public var user: SimpleUser?

    public init(starredAt: Date, user: SimpleUser? = nil) {
        self.starredAt = starredAt
        self.user = user
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.starredAt = try values.decode(Date.self, forKey: "starred_at")
        self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(starredAt, forKey: "starred_at")
        try values.encodeIfPresent(user, forKey: "user")
    }
}
