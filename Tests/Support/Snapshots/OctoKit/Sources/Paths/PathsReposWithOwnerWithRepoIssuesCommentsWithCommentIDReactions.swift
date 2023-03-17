// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Issues.Comments.WithCommentID {
    public var reactions: Reactions {
        Reactions(path: path + "/reactions")
    }

    public struct Reactions {
        /// Path: `/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions`
        public let path: String

        /// List reactions for an issue comment
        ///
        /// List the reactions to an [issue comment](https://docs.github.com/rest/reference/issues#comments).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/reactions#list-reactions-for-an-issue-comment)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Reaction]> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "reactions/list-for-issue-comment")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var content: Content?
            public var perPage: Int?
            public var page: Int?

            public enum Content: String, CaseIterable, Codable {
                case plus1 = "+1"
                case minus1 = "-1"
                case laugh
                case confused
                case heart
                case hooray
                case rocket
                case eyes
            }

            public init(content: Content? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.content = content
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(content, forKey: "content")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }

        /// Create reaction for an issue comment
        ///
        /// Create a reaction to an [issue comment](https://docs.github.com/rest/reference/issues#comments). A response with an HTTP `200` status means that you already added the reaction type to this issue comment.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/reactions#create-reaction-for-an-issue-comment)
        public func post(content: PostRequest.Content) -> Request<OctoKit.Reaction> {
            Request(path: path, method: "POST", body: PostRequest(content: content), id: "reactions/create-for-issue-comment")
        }

        public struct PostRequest: Encodable {
            /// The [reaction type](https://docs.github.com/rest/reference/reactions#reaction-types) to add to the issue comment.
            public var content: Content

            /// The [reaction type](https://docs.github.com/rest/reference/reactions#reaction-types) to add to the issue comment.
            public enum Content: String, CaseIterable, Codable {
                case plus1 = "+1"
                case minus1 = "-1"
                case laugh
                case confused
                case heart
                case hooray
                case rocket
                case eyes
            }

            public init(content: Content) {
                self.content = content
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(content, forKey: "content")
            }
        }
    }
}
