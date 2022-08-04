// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User.Memberships {
    public var orgs: Orgs {
        Orgs(path: path + "/orgs")
    }

    public struct Orgs {
        /// Path: `/user/memberships/orgs`
        public let path: String

        /// List organization memberships for the authenticated user
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-organization-memberships-for-the-authenticated-user)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.OrgMembership]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "orgs/list-memberships-for-authenticated-user")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var state: State?
            public var perPage: Int?
            public var page: Int?

            public enum State: String, Codable, CaseIterable {
                case active
                case pending
            }

            public init(state: State? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.state = state
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(state, forKey: "state")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }
    }
}
