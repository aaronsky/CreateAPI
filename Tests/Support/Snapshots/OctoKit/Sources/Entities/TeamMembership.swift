// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct TeamMembership: Codable {
    public var url: URL
    /// The role of the user in the team.
    ///
    /// Example: "member"
    public var role: Role
    /// The state of the user's membership in the team.
    public var state: State

    /// The role of the user in the team.
    ///
    /// Example: "member"
    public enum Role: String, CaseIterable, Codable {
        case member
        case maintainer
    }

    /// The state of the user's membership in the team.
    public enum State: String, CaseIterable, Codable {
        case active
        case pending
    }

    public init(url: URL, role: Role = .member, state: State) {
        self.url = url
        self.role = role
        self.state = state
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.role = try values.decode(Role.self, forKey: "role")
        self.state = try values.decode(State.self, forKey: "state")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(role, forKey: "role")
        try values.encode(state, forKey: "state")
    }
}
