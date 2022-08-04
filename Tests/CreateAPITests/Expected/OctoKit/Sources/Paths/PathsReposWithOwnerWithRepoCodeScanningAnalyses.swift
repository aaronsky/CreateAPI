// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.CodeScanning {
    public var analyses: Analyses {
        Analyses(path: path + "/analyses")
    }

    public struct Analyses {
        /// Path: `/repos/{owner}/{repo}/code-scanning/analyses`
        public let path: String

        /// List code scanning analyses for a repository
        ///
        /// Lists the details of all code scanning analyses for a repository,
        /// starting with the most recent.
        /// The response is paginated and you can use the `page` and `per_page` parameters
        /// to list the analyses you're interested in.
        /// By default 30 analyses are listed per page.
        /// 
        /// The `rules_count` field in the response give the number of rules
        /// that were run in the analysis.
        /// For very old analyses this data is not available,
        /// and `0` is returned in this field.
        /// 
        /// You must use an access token with the `security_events` scope to use this endpoint with private repos,
        /// the `public_repo` scope also grants permission to read security events on public repos only.
        /// GitHub Apps must have the `security_events` read permission to use this endpoint.
        /// 
        /// **Deprecation notice**:
        /// The `tool_name` field is deprecated and will, in future, not be included in the response for this endpoint. The example response reflects this change. The tool name can now be found inside the `tool` field.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/code-scanning#list-code-scanning-analyses-for-a-repository)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.CodeScanningAnalysis]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "code-scanning/list-recent-analyses")
        }

        public struct GetParameters {
            /// The name of the tool used to generate the code scanning analysis.
            public var toolName: String?
            /// The GUID of the tool used to generate the code scanning analysis, if provided in the uploaded SARIF data.
            public var toolGuid: String?
            public var page: Int?
            public var perPage: Int?
            /// The full Git reference, formatted as `refs/heads/<branch name>`,
            /// `refs/pull/<number>/merge`, or `refs/pull/<number>/head`.
            public var ref: String?
            /// An identifier for the upload.
            ///
            /// Example: "6c81cd8e-b078-4ac3-a3be-1dad7dbd0b53"
            public var sarifID: String?

            public init(toolName: String? = nil, toolGuid: String? = nil, page: Int? = nil, perPage: Int? = nil, ref: String? = nil, sarifID: String? = nil) {
                self.toolName = toolName
                self.toolGuid = toolGuid
                self.page = page
                self.perPage = perPage
                self.ref = ref
                self.sarifID = sarifID
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(toolName, forKey: "tool_name")
                encoder.encode(toolGuid, forKey: "tool_guid")
                encoder.encode(page, forKey: "page")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(ref, forKey: "ref")
                encoder.encode(sarifID, forKey: "sarif_id")
                return encoder.items
            }
        }
    }
}
