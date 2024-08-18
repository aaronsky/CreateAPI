// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Collaborators {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/repos/{owner}/{repo}/collaborators/{username}`
        public let path: String

        /// Check if a user is a repository collaborator
        ///
        /// For organization-owned repositories, the list of collaborators includes outside collaborators, organization members that are direct collaborators, organization members with access through team memberships, organization members with access through default organization permissions, and organization owners.
        /// 
        /// Team members will include the members of child teams.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#check-if-a-user-is-a-repository-collaborator)
        public var get: Request<Void> {
            Request(path: path, method: "GET", id: "repos/check-collaborator")
        }

        /// Add a repository collaborator
        ///
        /// This endpoint triggers [notifications](https://docs.github.com/en/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. See "[Secondary rate limits](https://docs.github.com/rest/overview/resources-in-the-rest-api#secondary-rate-limits)" and "[Dealing with secondary rate limits](https://docs.github.com/rest/guides/best-practices-for-integrators#dealing-with-secondary-rate-limits)" for details.
        /// 
        /// For more information on permission levels, see "[Repository permission levels for an organization](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization#permission-levels-for-repositories-owned-by-an-organization)". There are restrictions on which permissions can be granted to organization members when an organization base role is in place. In this case, the permission being given must be equal to or higher than the org base permission. Otherwise, the request will fail with:
        /// 
        /// ```
        /// Cannot assign {member} permission of {role name}
        /// ```
        /// 
        /// Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP verbs](https://docs.github.com/rest/overview/resources-in-the-rest-api#http-verbs)."
        /// 
        /// The invitee will receive a notification that they have been invited to the repository, which they must accept or decline. They may do this via the notifications page, the email they receive, or by using the [repository invitations API endpoints](https://docs.github.com/rest/reference/repos#invitations).
        /// 
        /// **Rate limits**
        /// 
        /// You are limited to sending 50 invitations to a repository per 24 hour period. Note there is no limit if you are inviting organization members to an organization repository.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#add-a-repository-collaborator)
        public func put(_ body: PutRequest? = nil) -> Request<OctoKit.RepositoryInvitation> {
            Request(path: path, method: "PUT", body: body, id: "repos/add-collaborator")
        }

        public struct PutRequest: Encodable {
            /// The permission to grant the collaborator. **Only valid on organization-owned repositories.** Can be one of:  
            /// \* `pull` - can pull, but not push to or administer this repository.  
            /// \* `push` - can pull and push, but not administer this repository.  
            /// \* `admin` - can pull, push and administer this repository.  
            /// \* `maintain` - Recommended for project managers who need to manage the repository without access to sensitive or destructive actions.  
            /// \* `triage` - Recommended for contributors who need to proactively manage issues and pull requests without write access.  
            /// \* custom repository role name - A custom repository role, if the owning organization has defined any.
            public var permission: Permission?
            /// Example: "push"
            public var permissions: String?

            /// The permission to grant the collaborator. **Only valid on organization-owned repositories.** Can be one of:  
            /// \* `pull` - can pull, but not push to or administer this repository.  
            /// \* `push` - can pull and push, but not administer this repository.  
            /// \* `admin` - can pull, push and administer this repository.  
            /// \* `maintain` - Recommended for project managers who need to manage the repository without access to sensitive or destructive actions.  
            /// \* `triage` - Recommended for contributors who need to proactively manage issues and pull requests without write access.  
            /// \* custom repository role name - A custom repository role, if the owning organization has defined any.
            public enum Permission: String, CaseIterable, Codable {
                case pull
                case push
                case admin
                case maintain
                case triage
            }

            public init(permission: Permission? = .push, permissions: String? = nil) {
                self.permission = permission
                self.permissions = permissions
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(permission, forKey: "permission")
                try values.encodeIfPresent(permissions, forKey: "permissions")
            }
        }

        /// Remove a repository collaborator
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#remove-a-repository-collaborator)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "repos/remove-collaborator")
        }
    }
}
