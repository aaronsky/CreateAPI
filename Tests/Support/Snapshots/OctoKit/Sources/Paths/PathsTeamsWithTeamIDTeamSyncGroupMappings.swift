// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Teams.WithTeamID.TeamSync {
    public var groupMappings: GroupMappings {
        GroupMappings(path: path + "/group-mappings")
    }

    public struct GroupMappings {
        /// Path: `/teams/{team_id}/team-sync/group-mappings`
        public let path: String

        /// List IdP groups for a team (Legacy)
        ///
        /// **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List IdP groups for a team`](https://docs.github.com/rest/reference/teams#list-idp-groups-for-a-team) endpoint.
        /// 
        /// Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// List IdP groups connected to a team on GitHub.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#list-idp-groups-for-a-team-legacy)
        @available(*, deprecated, message: "Deprecated")
        public var get: Request<OctoKit.GroupMapping> {
            Request(path: path, method: "GET", id: "teams/list-idp-groups-for-legacy")
        }

        /// Create or update IdP group connections (Legacy)
        ///
        /// **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`Create or update IdP group connections`](https://docs.github.com/rest/reference/teams#create-or-update-idp-group-connections) endpoint.
        /// 
        /// Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Creates, updates, or removes a connection between a team and an IdP group. When adding groups to a team, you must include all new and existing groups to avoid replacing existing groups with the new ones. Specifying an empty `groups` array will remove all connections for a team.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#create-or-update-idp-group-connections-legacy)
        @available(*, deprecated, message: "Deprecated")
        public func patch(_ body: PatchRequest) -> Request<OctoKit.GroupMapping> {
            Request(path: path, method: "PATCH", body: body, id: "teams/create-or-update-idp-group-connections-legacy")
        }

        public struct PatchRequest: Encodable {
            /// The IdP groups you want to connect to a GitHub team. When updating, the new `groups` object will replace the original one. You must include any existing groups that you don't want to remove.
            public var groups: [Group]
            /// Example: "I am not a timestamp"
            public var syncedAt: String?

            public struct Group: Encodable {
                /// ID of the IdP group.
                public var groupID: String
                /// Name of the IdP group.
                public var groupName: String
                /// Description of the IdP group.
                public var groupDescription: String
                /// Example: "caceab43fc9ffa20081c"
                public var id: String?
                /// Example: "external-team-6c13e7288ef7"
                public var name: String?
                /// Example: "moar cheese pleese"
                public var description: String?

                public init(groupID: String, groupName: String, groupDescription: String, id: String? = nil, name: String? = nil, description: String? = nil) {
                    self.groupID = groupID
                    self.groupName = groupName
                    self.groupDescription = groupDescription
                    self.id = id
                    self.name = name
                    self.description = description
                }

                public func encode(to encoder: any Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(groupID, forKey: "group_id")
                    try values.encode(groupName, forKey: "group_name")
                    try values.encode(groupDescription, forKey: "group_description")
                    try values.encodeIfPresent(id, forKey: "id")
                    try values.encodeIfPresent(name, forKey: "name")
                    try values.encodeIfPresent(description, forKey: "description")
                }
            }

            public init(groups: [Group], syncedAt: String? = nil) {
                self.groups = groups
                self.syncedAt = syncedAt
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(groups, forKey: "groups")
                try values.encodeIfPresent(syncedAt, forKey: "synced_at")
            }
        }
    }
}
