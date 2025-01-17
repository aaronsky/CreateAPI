// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct CodeScanningAnalysis: Codable {
    /// The full Git reference, formatted as `refs/heads/<branch name>`,
    /// `refs/pull/<number>/merge`, or `refs/pull/<number>/head`.
    public var ref: String
    /// The SHA of the commit to which the analysis you are uploading relates.
    public var commitSha: String
    /// Identifies the configuration under which the analysis was executed. For example, in GitHub Actions this includes the workflow filename and job name.
    public var analysisKey: String
    /// Identifies the variable values associated with the environment in which this analysis was performed.
    public var environment: String
    /// Identifies the configuration under which the analysis was executed. Used to distinguish between multiple analyses for the same tool and commit, but performed on different languages or different parts of the code.
    public var category: String?
    /// Example: "error reading field xyz"
    public var error: String
    /// The time that the analysis was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    public var createdAt: Date
    /// The total number of results in the analysis.
    public var resultsCount: Int
    /// The total number of rules used in the analysis.
    public var rulesCount: Int
    /// Unique identifier for this analysis.
    public var id: Int
    /// The REST API URL of the analysis resource.
    public var url: URL
    /// An identifier for the upload.
    ///
    /// Example: "6c81cd8e-b078-4ac3-a3be-1dad7dbd0b53"
    public var sarifID: String
    public var tool: CodeScanningAnalysisTool
    public var isDeletable: Bool
    /// Warning generated when processing the analysis
    ///
    /// Example: "123 results were ignored"
    public var warning: String

    public init(ref: String, commitSha: String, analysisKey: String, environment: String, category: String? = nil, error: String, createdAt: Date, resultsCount: Int, rulesCount: Int, id: Int, url: URL, sarifID: String, tool: CodeScanningAnalysisTool, isDeletable: Bool, warning: String) {
        self.ref = ref
        self.commitSha = commitSha
        self.analysisKey = analysisKey
        self.environment = environment
        self.category = category
        self.error = error
        self.createdAt = createdAt
        self.resultsCount = resultsCount
        self.rulesCount = rulesCount
        self.id = id
        self.url = url
        self.sarifID = sarifID
        self.tool = tool
        self.isDeletable = isDeletable
        self.warning = warning
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ref = try values.decode(String.self, forKey: "ref")
        self.commitSha = try values.decode(String.self, forKey: "commit_sha")
        self.analysisKey = try values.decode(String.self, forKey: "analysis_key")
        self.environment = try values.decode(String.self, forKey: "environment")
        self.category = try values.decodeIfPresent(String.self, forKey: "category")
        self.error = try values.decode(String.self, forKey: "error")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.resultsCount = try values.decode(Int.self, forKey: "results_count")
        self.rulesCount = try values.decode(Int.self, forKey: "rules_count")
        self.id = try values.decode(Int.self, forKey: "id")
        self.url = try values.decode(URL.self, forKey: "url")
        self.sarifID = try values.decode(String.self, forKey: "sarif_id")
        self.tool = try values.decode(CodeScanningAnalysisTool.self, forKey: "tool")
        self.isDeletable = try values.decode(Bool.self, forKey: "deletable")
        self.warning = try values.decode(String.self, forKey: "warning")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(ref, forKey: "ref")
        try values.encode(commitSha, forKey: "commit_sha")
        try values.encode(analysisKey, forKey: "analysis_key")
        try values.encode(environment, forKey: "environment")
        try values.encodeIfPresent(category, forKey: "category")
        try values.encode(error, forKey: "error")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(resultsCount, forKey: "results_count")
        try values.encode(rulesCount, forKey: "rules_count")
        try values.encode(id, forKey: "id")
        try values.encode(url, forKey: "url")
        try values.encode(sarifID, forKey: "sarif_id")
        try values.encode(tool, forKey: "tool")
        try values.encode(isDeletable, forKey: "deletable")
        try values.encode(warning, forKey: "warning")
    }
}
