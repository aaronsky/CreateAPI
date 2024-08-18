// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Runs.WithRunID.Attempts.WithAttemptNumber {
    public var jobs: Jobs {
        Jobs(path: path + "/jobs")
    }

    public struct Jobs {
        /// Path: `/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/jobs`
        public let path: String

        /// List jobs for a workflow run attempt
        ///
        /// Lists jobs for a specific workflow run attempt. Anyone with read access to the repository can use this endpoint. If the repository is private you must use an access token with the `repo` scope. GitHub Apps must have the `actions:read` permission to use this endpoint. You can use parameters to narrow the list of results. For more information about using parameters, see [Parameters](https://docs.github.com/rest/overview/resources-in-the-rest-api#parameters).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#list-jobs-for-a-workflow-run-attempt)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "actions/list-jobs-for-workflow-run-attempt")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var jobs: [OctoKit.Job]

            public init(totalCount: Int, jobs: [OctoKit.Job]) {
                self.totalCount = totalCount
                self.jobs = jobs
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.jobs = try values.decode([OctoKit.Job].self, forKey: "jobs")
            }
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }
    }
}
