// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var merges: Merges {
        Merges(path: path + "/merges")
    }

    public struct Merges {
        /// Path: `/repos/{owner}/{repo}/merges`
        public let path: String

        /// Merge a branch
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#merge-a-branch)
        public func post(_ body: PostRequest) -> Request<OctoKit.Commit> {
            Request(method: "POST", url: path, body: body, id: "repos/merge")
        }

        public struct PostRequest: Encodable {
            /// The name of the base branch that the head will be merged into.
            public var base: String
            /// The head to merge. This can be a branch name or a commit SHA1.
            public var head: String
            /// Commit message to use for the merge commit. If omitted, a default message will be used.
            public var commitMessage: String?

            public init(base: String, head: String, commitMessage: String? = nil) {
                self.base = base
                self.head = head
                self.commitMessage = commitMessage
            }

            private enum CodingKeys: String, CodingKey {
                case base
                case head
                case commitMessage = "commit_message"
            }
        }
    }
}
