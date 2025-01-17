// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// External Groups to be mapped to a team for membership
public struct GroupMapping: Codable {
    /// Array of groups to be mapped to this team
    ///
    /// Example:
    ///
    /// [
    ///   {
    ///     "group_description" : "A group of Developers working on AzureAD SAML SSO",
    ///     "group_id" : "111a1a11-aaa1-1aaa-11a1-a1a1a1a1a1aa",
    ///     "group_name" : "saml-azuread-test"
    ///   },
    ///   {
    ///     "group_description" : "Another group of Developers working on AzureAD SAML SSO",
    ///     "group_id" : "2bb2bb2b-bb22-22bb-2bb2-bb2bbb2bb2b2",
    ///     "group_name" : "saml-azuread-test2"
    ///   }
    /// ]
    public var groups: [Group]?

    public struct Group: Codable {
        /// The ID of the group
        ///
        /// Example: "111a1a11-aaa1-1aaa-11a1-a1a1a1a1a1aa"
        public var groupID: String
        /// The name of the group
        ///
        /// Example: "saml-azuread-test"
        public var groupName: String
        /// A description of the group
        ///
        /// Example: "A group of Developers working on AzureAD SAML SSO"
        public var groupDescription: String
        /// Synchronization status for this group mapping
        ///
        /// Example: "unsynced"
        public var status: String?
        /// The time of the last sync for this group-mapping
        ///
        /// Example: "2019-06-03 22:27:15:000 -700"
        public var syncedAt: String?

        public init(groupID: String, groupName: String, groupDescription: String, status: String? = nil, syncedAt: String? = nil) {
            self.groupID = groupID
            self.groupName = groupName
            self.groupDescription = groupDescription
            self.status = status
            self.syncedAt = syncedAt
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.groupID = try values.decode(String.self, forKey: "group_id")
            self.groupName = try values.decode(String.self, forKey: "group_name")
            self.groupDescription = try values.decode(String.self, forKey: "group_description")
            self.status = try values.decodeIfPresent(String.self, forKey: "status")
            self.syncedAt = try values.decodeIfPresent(String.self, forKey: "synced_at")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(groupID, forKey: "group_id")
            try values.encode(groupName, forKey: "group_name")
            try values.encode(groupDescription, forKey: "group_description")
            try values.encodeIfPresent(status, forKey: "status")
            try values.encodeIfPresent(syncedAt, forKey: "synced_at")
        }
    }

    public init(groups: [Group]? = nil) {
        self.groups = groups
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.groups = try values.decodeIfPresent([Group].self, forKey: "groups")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(groups, forKey: "groups")
    }
}
