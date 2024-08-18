// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Projects.Columns.WithColumnID {
    public var cards: Cards {
        Cards(path: path + "/cards")
    }

    public struct Cards {
        /// Path: `/projects/columns/{column_id}/cards`
        public let path: String

        /// List project cards
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/projects#list-project-cards)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.ProjectCard]> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "projects/list-cards")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var archivedState: ArchivedState?
            public var perPage: Int?
            public var page: Int?

            public enum ArchivedState: String, CaseIterable, Codable {
                case all
                case archived
                case notArchived = "not_archived"
            }

            public init(archivedState: ArchivedState? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.archivedState = archivedState
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(archivedState, forKey: "archived_state")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }

        /// Create a project card
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/projects#create-a-project-card)
        public func post(_ body: PostRequest) -> Request<OctoKit.ProjectCard> {
            Request(path: path, method: "POST", body: body, id: "projects/create-card")
        }

        public enum PostRequest: Encodable {
            case a(A)
            case b(B)

            public struct A: Encodable {
                /// The project card's note
                ///
                /// Example: "Update all gems"
                public var note: String?

                public init(note: String? = nil) {
                    self.note = note
                }

                public func encode(to encoder: any Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encodeIfPresent(note, forKey: "note")
                }
            }

            public struct B: Encodable {
                /// The unique identifier of the content associated with the card
                ///
                /// Example: 42
                public var contentID: Int
                /// The piece of content associated with the card
                ///
                /// Example: "PullRequest"
                public var contentType: String

                public init(contentID: Int, contentType: String) {
                    self.contentID = contentID
                    self.contentType = contentType
                }

                public func encode(to encoder: any Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(contentID, forKey: "content_id")
                    try values.encode(contentType, forKey: "content_type")
                }
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .a(let value): try container.encode(value)
                case .b(let value): try container.encode(value)
                }
            }
        }
    }
}
