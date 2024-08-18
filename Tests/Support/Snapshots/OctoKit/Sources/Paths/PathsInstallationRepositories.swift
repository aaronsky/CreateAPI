// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Installation {
    public var repositories: Repositories {
        Repositories(path: path + "/repositories")
    }

    public struct Repositories {
        /// Path: `/installation/repositories`
        public let path: String

        /// List repositories accessible to the app installation
        ///
        /// List repositories that an app installation can access.
        /// 
        /// You must use an [installation access token](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-an-installation) to access this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/apps#list-repositories-accessible-to-the-app-installation)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "apps/list-repos-accessible-to-installation")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var repositories: [OctoKit.Repository]
            /// Example: "selected"
            public var repositorySelection: String?

            public init(totalCount: Int, repositories: [OctoKit.Repository], repositorySelection: String? = nil) {
                self.totalCount = totalCount
                self.repositories = repositories
                self.repositorySelection = repositorySelection
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.repositories = try values.decode([OctoKit.Repository].self, forKey: "repositories")
                self.repositorySelection = try values.decodeIfPresent(String.self, forKey: "repository_selection")
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
