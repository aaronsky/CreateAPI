// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Search {
    public var labels: Labels {
        Labels(path: path + "/labels")
    }

    public struct Labels {
        /// Path: `/search/labels`
        public let path: String

        /// Search labels
        ///
        /// Find labels in a repository with names or descriptions that match search keywords. Returns up to 100 results [per page](https://docs.github.com/rest/overview/resources-in-the-rest-api#pagination).
        /// 
        /// When searching for labels, you can get text match metadata for the label **name** and **description** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/reference/search#text-match-metadata).
        /// 
        /// For example, if you want to find labels in the `linguist` repository that match `bug`, `defect`, or `enhancement`. Your query might look like this:
        /// 
        /// `q=bug+defect+enhancement&repository_id=64778136`
        /// 
        /// The labels that best match the query appear first in the search results.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/search#search-labels)
        public func get(parameters: GetParameters) -> Request<GetResponse> {
            Request(path: path, method: "GET", query: parameters.asQuery, id: "search/labels")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var isIncompleteResults: Bool
            public var items: [OctoKit.LabelSearchResultItem]

            public init(totalCount: Int, isIncompleteResults: Bool, items: [OctoKit.LabelSearchResultItem]) {
                self.totalCount = totalCount
                self.isIncompleteResults = isIncompleteResults
                self.items = items
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.isIncompleteResults = try values.decode(Bool.self, forKey: "incomplete_results")
                self.items = try values.decode([OctoKit.LabelSearchResultItem].self, forKey: "items")
            }
        }

        public struct GetParameters {
            public var repositoryID: Int
            public var q: String
            public var sort: Sort?
            public var order: Order?
            public var perPage: Int?
            public var page: Int?

            public enum Sort: String, CaseIterable, Codable {
                case created
                case updated
            }

            public enum Order: String, CaseIterable, Codable {
                case desc
                case asc
            }

            public init(repositoryID: Int, q: String, sort: Sort? = nil, order: Order? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.repositoryID = repositoryID
                self.q = q
                self.sort = sort
                self.order = order
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(repositoryID, forKey: "repository_id")
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
