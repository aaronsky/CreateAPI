// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var milestones: Milestones {
        Milestones(path: path + "/milestones")
    }

    public struct Milestones {
        /// Path: `/repos/{owner}/{repo}/milestones`
        public let path: String

        /// List milestones
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/issues#list-milestones)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Milestone]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "issues/list-milestones")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var state: State?
            public var sort: Sort?
            public var direction: Direction?
            public var perPage: Int?
            public var page: Int?

            public enum State: String, Codable, CaseIterable {
                case `open`
                case closed
                case all
            }

            public enum Sort: String, Codable, CaseIterable {
                case dueOn = "due_on"
                case completeness
            }

            public enum Direction: String, Codable, CaseIterable {
                case asc
                case desc
            }

            public init(state: State? = nil, sort: Sort? = nil, direction: Direction? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.state = state
                self.sort = sort
                self.direction = direction
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(state, forKey: "state")
                encoder.encode(sort, forKey: "sort")
                encoder.encode(direction, forKey: "direction")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }

        /// Create a milestone
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/issues#create-a-milestone)
        public func post(_ body: PostRequest) -> Request<OctoKit.Milestone> {
            Request(method: "POST", url: path, body: body, id: "issues/create-milestone")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// The title of the milestone.
            public var title: String
            /// The state of the milestone. Either `open` or `closed`.
            public var state: State?
            /// A description of the milestone.
            public var description: String?
            /// The milestone due date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
            public var dueOn: Date?

            /// The state of the milestone. Either `open` or `closed`.
            public enum State: String, Codable, CaseIterable {
                case `open`
                case closed
            }

            public init(title: String, state: State? = nil, description: String? = nil, dueOn: Date? = nil) {
                self.title = title
                self.state = state
                self.description = description
                self.dueOn = dueOn
            }

            private enum CodingKeys: String, CodingKey {
                case title
                case state
                case description
                case dueOn = "due_on"
            }
        }
    }
}
