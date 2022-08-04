// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Teams.WithTeamSlug.Discussions.WithDiscussionNumber {
    public var reactions: Reactions {
        Reactions(path: path + "/reactions")
    }

    public struct Reactions {
        /// Path: `/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/reactions`
        public let path: String

        /// List reactions for a team discussion
        ///
        /// List the reactions to a [team discussion](https://docs.github.com/rest/reference/teams#discussions). OAuth access tokens require the `read:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/reactions#list-reactions-for-a-team-discussion)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Reaction]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "reactions/list-for-team-discussion-in-org")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var content: Content?
            public var perPage: Int?
            public var page: Int?

            public enum Content: String, Codable, CaseIterable {
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

        /// Create reaction for a team discussion
        ///
        /// Create a reaction to a [team discussion](https://docs.github.com/rest/reference/teams#discussions). OAuth access tokens require the `write:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/). A response with an HTTP `200` status means that you already added the reaction type to this team discussion.
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/reactions#create-reaction-for-a-team-discussion)
        public func post(content: PostRequest.Content) -> Request<OctoKit.Reaction> {
            Request(method: "POST", url: path, body: PostRequest(content: content), id: "reactions/create-for-team-discussion-in-org")
        }

        public struct PostRequest: Encodable {
            /// The [reaction type](https://docs.github.com/rest/reference/reactions#reaction-types) to add to the team discussion.
            public var content: Content

            /// The [reaction type](https://docs.github.com/rest/reference/reactions#reaction-types) to add to the team discussion.
            public enum Content: String, Codable, CaseIterable {
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
        }
    }
}
