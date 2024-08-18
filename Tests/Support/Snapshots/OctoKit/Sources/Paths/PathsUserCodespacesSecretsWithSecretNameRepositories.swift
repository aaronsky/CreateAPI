// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User.Codespaces.Secrets.WithSecretName {
    public var repositories: Repositories {
        Repositories(path: path + "/repositories")
    }

    public struct Repositories {
        /// Path: `/user/codespaces/secrets/{secret_name}/repositories`
        public let path: String

        /// List selected repositories for a user secret
        ///
        /// List the repositories that have been granted the ability to use a user's codespace secret.
        /// You must authenticate using an access token with the `user` or `read:user` scope to use this endpoint. User must have Codespaces access to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/codespaces#list-selected-repositories-for-a-user-secret)
        public var get: Request<GetResponse> {
            Request(path: path, method: "GET", id: "codespaces/list-repositories-for-secret-for-authenticated-user")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var repositories: [OctoKit.MinimalRepository]

            public init(totalCount: Int, repositories: [OctoKit.MinimalRepository]) {
                self.totalCount = totalCount
                self.repositories = repositories
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.repositories = try values.decode([OctoKit.MinimalRepository].self, forKey: "repositories")
            }
        }

        /// Set selected repositories for a user secret
        ///
        /// Select the repositories that will use a user's codespace secret.
        /// You must authenticate using an access token with the `user` or `read:user` scope to use this endpoint. User must have Codespaces access to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/codespaces#set-selected-repositories-for-a-user-secret)
        public func put(selectedRepositoryIDs: [Int]) -> Request<Void> {
            Request(path: path, method: "PUT", body: ["selected_repository_ids": selectedRepositoryIDs], id: "codespaces/set-repositories-for-secret-for-authenticated-user")
        }
    }
}
