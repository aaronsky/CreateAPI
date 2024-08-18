// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Memberships {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/orgs/{org}/memberships/{username}`
        public let path: String

        /// Get organization membership for a user
        ///
        /// In order to get a user's membership with an organization, the authenticated user must be an organization member. The `state` parameter in the response can be used to identify the user's membership status.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#get-organization-membership-for-a-user)
        public var get: Request<OctoKit.OrgMembership> {
            Request(path: path, method: "GET", id: "orgs/get-membership-for-user")
        }

        /// Set organization membership for a user
        ///
        /// Only authenticated organization owners can add a member to the organization or update the member's role.
        /// 
        /// *   If the authenticated user is _adding_ a member to the organization, the invited user will receive an email inviting them to the organization. The user's [membership status](https://docs.github.com/rest/reference/orgs#get-organization-membership-for-a-user) will be `pending` until they accept the invitation.
        ///     
        /// *   Authenticated users can _update_ a user's membership by passing the `role` parameter. If the authenticated user changes a member's role to `admin`, the affected user will receive an email notifying them that they've been made an organization owner. If the authenticated user changes an owner's role to `member`, no email will be sent.
        /// 
        /// **Rate limits**
        /// 
        /// To prevent abuse, the authenticated user is limited to 50 organization invitations per 24 hour period. If the organization is more than one month old or on a paid plan, the limit is 500 invitations per 24 hour period.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#set-organization-membership-for-a-user)
        public func put(role: PutRequest.Role? = nil) -> Request<OctoKit.OrgMembership> {
            Request(path: path, method: "PUT", body: PutRequest(role: role), id: "orgs/set-membership-for-user")
        }

        public struct PutRequest: Encodable {
            /// The role to give the user in the organization. Can be one of:  
            /// \* `admin` - The user will become an owner of the organization.  
            /// \* `member` - The user will become a non-owner member of the organization.
            public var role: Role?

            /// The role to give the user in the organization. Can be one of:  
            /// \* `admin` - The user will become an owner of the organization.  
            /// \* `member` - The user will become a non-owner member of the organization.
            public enum Role: String, CaseIterable, Codable {
                case admin
                case member
            }

            public init(role: Role? = .member) {
                self.role = role
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(role, forKey: "role")
            }
        }

        /// Remove organization membership for a user
        ///
        /// In order to remove a user's membership with an organization, the authenticated user must be an organization owner.
        /// 
        /// If the specified user is an active member of the organization, this will remove them from the organization. If the specified user has been invited to the organization, this will cancel their invitation. The specified user will receive an email notification in both cases.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#remove-organization-membership-for-a-user)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "orgs/remove-membership-for-user")
        }
    }
}
