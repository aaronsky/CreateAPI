// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct OrgMembership: Codable {
    /// Example: "https://api.github.com/orgs/octocat/memberships/defunkt"
    public var url: URL
    /// The state of the member in the organization. The `pending` state indicates the user has not yet accepted an invitation.
    ///
    /// Example: "active"
    public var state: State
    /// The user's membership type in the organization.
    ///
    /// Example: "admin"
    public var role: Role
    /// Example: "https://api.github.com/orgs/octocat"
    public var organizationURL: URL
    /// Organization Simple
    public var organization: OrganizationSimple
    /// Simple User
    public var user: SimpleUser?
    public var permissions: Permissions?

    /// The state of the member in the organization. The `pending` state indicates the user has not yet accepted an invitation.
    ///
    /// Example: "active"
    public enum State: String, CaseIterable, Codable {
        case active
        case pending
    }

    /// The user's membership type in the organization.
    ///
    /// Example: "admin"
    public enum Role: String, CaseIterable, Codable {
        case admin
        case member
        case billingManager = "billing_manager"
    }

    public struct Permissions: Codable {
        public var canCreateRepository: Bool

        public init(canCreateRepository: Bool) {
            self.canCreateRepository = canCreateRepository
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.canCreateRepository = try values.decode(Bool.self, forKey: "can_create_repository")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(canCreateRepository, forKey: "can_create_repository")
        }
    }

    public init(url: URL, state: State, role: Role, organizationURL: URL, organization: OrganizationSimple, user: SimpleUser? = nil, permissions: Permissions? = nil) {
        self.url = url
        self.state = state
        self.role = role
        self.organizationURL = organizationURL
        self.organization = organization
        self.user = user
        self.permissions = permissions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.state = try values.decode(State.self, forKey: "state")
        self.role = try values.decode(Role.self, forKey: "role")
        self.organizationURL = try values.decode(URL.self, forKey: "organization_url")
        self.organization = try values.decode(OrganizationSimple.self, forKey: "organization")
        self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
        self.permissions = try values.decodeIfPresent(Permissions.self, forKey: "permissions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(state, forKey: "state")
        try values.encode(role, forKey: "role")
        try values.encode(organizationURL, forKey: "organization_url")
        try values.encode(organization, forKey: "organization")
        try values.encodeIfPresent(user, forKey: "user")
        try values.encodeIfPresent(permissions, forKey: "permissions")
    }
}
