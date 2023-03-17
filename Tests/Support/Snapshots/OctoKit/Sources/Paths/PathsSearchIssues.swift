// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Search {
    public var issues: Issues {
        Issues(path: path + "/issues")
    }

    public struct Issues {
        /// Path: `/search/issues`
        public let path: String

        /// Search issues and pull requests
        ///
        /// Find issues by state and keyword. This method returns up to 100 results [per page](https://docs.github.com/rest/overview/resources-in-the-rest-api#pagination).
        /// 
        /// When searching for issues, you can get text match metadata for the issue **title**, issue **body**, and issue **comment body** fields when you pass the `text-match` media type. For more details about how to receive highlighted
        /// search results, see [Text match metadata](https://docs.github.com/rest/reference/search#text-match-metadata).
        /// 
        /// For example, if you want to find the oldest unresolved Python bugs on Windows. Your query might look something like this.
        /// 
        /// `q=windows+label:bug+language:python+state:open&sort=created&order=asc`
        /// 
        /// This query searches for the keyword `windows`, within any open issue that is labeled as `bug`. The search runs across repositories whose primary language is Python. The results are sorted by creation date in ascending order, which means the oldest issues appear first in the search results.
        /// 
        /// **Note:** For [user-to-server](https://docs.github.com/developers/apps/identifying-and-authorizing-users-for-github-apps#user-to-server-requests) GitHub App requests, you can't retrieve a combination of issues and pull requests in a single query. Requests that don't include the `is:issue` or `is:pull-request` qualifier will receive an HTTP `422 Unprocessable Entity` response. To get results for both issues and pull requests, you must send separate queries for issues and pull requests. For more information about the `is` qualifier, see "[Searching only issues or pull requests](https://docs.github.com/github/searching-for-information-on-github/searching-issues-and-pull-requests#search-only-issues-or-pull-requests)."
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/search#search-issues-and-pull-requests)
        public func get(parameters: GetParameters) -> Request<GetResponse> {
            Request(path: path, method: "GET", query: parameters.asQuery, id: "search/issues-and-pull-requests")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var isIncompleteResults: Bool
            public var items: [OctoKit.IssueSearchResultItem]

            public init(totalCount: Int, isIncompleteResults: Bool, items: [OctoKit.IssueSearchResultItem]) {
                self.totalCount = totalCount
                self.isIncompleteResults = isIncompleteResults
                self.items = items
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.isIncompleteResults = try values.decode(Bool.self, forKey: "incomplete_results")
                self.items = try values.decode([OctoKit.IssueSearchResultItem].self, forKey: "items")
            }
        }

        public struct GetParameters {
            public var q: String
            public var sort: Sort?
            public var order: Order?
            public var perPage: Int?
            public var page: Int?

            public enum Sort: String, CaseIterable, Codable {
                case comments
                case reactions
                case reactionsPlusOne = "reactions-+1"
                case reactionsMinusOne = "reactions--1"
                case reactionsSmile = "reactions-smile"
                case reactionsThinkingFace = "reactions-thinking_face"
                case reactionsHeart = "reactions-heart"
                case reactionsTada = "reactions-tada"
                case interactions
                case created
                case updated
            }

            public enum Order: String, CaseIterable, Codable {
                case desc
                case asc
            }

            public init(q: String, sort: Sort? = nil, order: Order? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.q = q
                self.sort = sort
                self.order = order
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(q, forKey: "q")
                encoder.encode(sort, forKey: "sort")
                encoder.encode(order, forKey: "order")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }
    }
}
