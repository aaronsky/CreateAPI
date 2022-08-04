// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User.Installations.WithInstallationID {
    public var repositories: Repositories {
        Repositories(path: path + "/repositories")
    }

    public struct Repositories {
        /// Path: `/user/installations/{installation_id}/repositories`
        public let path: String

        /// List repositories accessible to the user access token
        ///
        /// List repositories that the authenticated user has explicit permission (`:read`, `:write`, or `:admin`) to access for an installation.
        /// 
        /// The authenticated user has explicit permission to access repositories they own, repositories where they are a collaborator, and repositories that they can access through an organization membership.
        /// 
        /// You must use a [user-to-server OAuth access token](https://docs.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/#identifying-users-on-your-site), created for a user who has authorized your GitHub App, to access this endpoint.
        /// 
        /// The access the user has to each repository is included in the hash under the `permissions` key.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/apps#list-repositories-accessible-to-the-user-access-token)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "apps/list-installation-repos-for-authenticated-user")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var repositorySelection: String?
            public var repositories: [OctoKit.Repository]

            public init(totalCount: Int, repositorySelection: String? = nil, repositories: [OctoKit.Repository]) {
                self.totalCount = totalCount
                self.repositorySelection = repositorySelection
                self.repositories = repositories
            }

            private enum CodingKeys: String, CodingKey {
                case totalCount = "total_count"
                case repositorySelection = "repository_selection"
                case repositories
            }
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }
    }
}
