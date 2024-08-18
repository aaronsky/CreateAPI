// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Git.Refs {
    public func ref(_ ref: String) -> WithRef {
        WithRef(path: "\(path)/\(ref)")
    }

    public struct WithRef {
        /// Path: `/repos/{owner}/{repo}/git/refs/{ref}`
        public let path: String

        /// Update a reference
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/git#update-a-reference)
        public func patch(_ body: PatchRequest) -> Request<OctoKit.GitRef> {
            Request(path: path, method: "PATCH", body: body, id: "git/update-ref")
        }

        public struct PatchRequest: Encodable {
            /// The SHA1 value to set this reference to
            public var sha: String
            /// Indicates whether to force the update or to make sure the update is a fast-forward update. Leaving this out or setting it to `false` will make sure you're not overwriting work.
            public var isForce: Bool?

            public init(sha: String, isForce: Bool? = false) {
                self.sha = sha
                self.isForce = isForce
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(sha, forKey: "sha")
                try values.encodeIfPresent(isForce, forKey: "force")
            }
        }

        /// Delete a reference
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/git#delete-a-reference)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "git/delete-ref")
        }
    }
}
