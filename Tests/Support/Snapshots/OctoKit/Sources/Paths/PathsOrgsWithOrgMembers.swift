// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var members: Members {
        Members(path: path + "/members")
    }

    public struct Members {
        /// Path: `/orgs/{org}/members`
        public let path: String

        /// List organization members
        ///
        /// List all users who are members of an organization. If the authenticated user is also a member of this organization then both concealed and public members will be returned.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-organization-members)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.SimpleUser]> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "orgs/list-members")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var filter: Filter?
            public var role: Role?
            public var perPage: Int?
            public var page: Int?

            public enum Filter: String, CaseIterable, Codable {
                case _2faDisabled = "2fa_disabled"
                case all
            }

            public enum Role: String, CaseIterable, Codable {
                case all
                case admin
                case member
            }

            public init(filter: Filter? = nil, role: Role? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.filter = filter
                self.role = role
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(filter, forKey: "filter")
                encoder.encode(role, forKey: "role")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }
    }
}
