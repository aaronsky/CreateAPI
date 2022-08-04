// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Comments {
    public func commentID(_ commentID: Int) -> WithCommentID {
        WithCommentID(path: "\(path)/\(commentID)")
    }

    public struct WithCommentID {
        /// Path: `/repos/{owner}/{repo}/comments/{comment_id}`
        public let path: String

        /// Get a commit comment
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-a-commit-comment)
        public var get: Request<OctoKit.CommitComment> {
            Request(method: "GET", url: path, id: "repos/get-commit-comment")
        }

        /// Update a commit comment
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#update-a-commit-comment)
        public func patch(body: String) -> Request<OctoKit.CommitComment> {
            Request(method: "PATCH", url: path, body: ["body": body], id: "repos/update-commit-comment")
        }

        /// Delete a commit comment
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#delete-a-commit-comment)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "repos/delete-commit-comment")
        }
    }
}
