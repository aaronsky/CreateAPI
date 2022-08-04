// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var forks: Forks {
        Forks(path: path + "/forks")
    }

    public struct Forks {
        /// Path: `/repos/{owner}/{repo}/forks`
        public let path: String

        /// List forks
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-forks)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.MinimalRepository]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "repos/list-forks")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var sort: Sort?
            public var perPage: Int?
            public var page: Int?

            public enum Sort: String, Codable, CaseIterable {
                case newest
                case oldest
                case stargazers
                case watchers
            }

            public init(sort: Sort? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.sort = sort
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(sort, forKey: "sort")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }

        /// Create a fork
        ///
        /// Create a fork for the authenticated user.
        /// 
        /// **Note**: Forking a Repository happens asynchronously. You may have to wait a short period of time before you can access the git objects. If this takes longer than 5 minutes, be sure to contact [GitHub Support](https://support.github.com/contact?tags=dotcom-rest-api).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#create-a-fork)
        public func post(organization: String? = nil) -> Request<OctoKit.FullRepository> {
            Request(method: "POST", url: path, body: ["organization": organization], id: "repos/create-fork")
        }
    }
}
