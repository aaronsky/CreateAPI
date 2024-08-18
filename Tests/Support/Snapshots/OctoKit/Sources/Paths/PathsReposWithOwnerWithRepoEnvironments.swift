// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var environments: Environments {
        Environments(path: path + "/environments")
    }

    public struct Environments {
        /// Path: `/repos/{owner}/{repo}/environments`
        public let path: String

        /// Get all environments
        ///
        /// Get all environments for a repository.
        /// 
        /// Anyone with read access to the repository can use this endpoint. If the repository is private, you must use an access token with the `repo` scope. GitHub Apps must have the `actions:read` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-all-environments)
        public var get: Request<GetResponse> {
            Request(path: path, method: "GET", id: "repos/get-all-environments")
        }

        public struct GetResponse: Decodable {
            /// The number of environments in this repository
            public var totalCount: Int?
            public var environments: [OctoKit.Environment]?

            public init(totalCount: Int? = nil, environments: [OctoKit.Environment]? = nil) {
                self.totalCount = totalCount
                self.environments = environments
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decodeIfPresent(Int.self, forKey: "total_count")
                self.environments = try values.decodeIfPresent([OctoKit.Environment].self, forKey: "environments")
            }
        }
    }
}
