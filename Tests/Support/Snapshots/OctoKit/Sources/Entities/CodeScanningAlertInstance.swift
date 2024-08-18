// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct CodeScanningAlertInstance: Codable {
    /// The full Git reference, formatted as `refs/heads/<branch name>`,
    /// `refs/pull/<number>/merge`, or `refs/pull/<number>/head`.
    public var ref: String?
    /// Identifies the configuration under which the analysis was executed. For example, in GitHub Actions this includes the workflow filename and job name.
    public var analysisKey: String?
    /// Identifies the variable values associated with the environment in which the analysis that generated this alert instance was performed, such as the language that was analyzed.
    public var environment: String?
    /// Identifies the configuration under which the analysis was executed. Used to distinguish between multiple analyses for the same tool and commit, but performed on different languages or different parts of the code.
    public var category: String?
    /// State of a code scanning alert.
    public var state: CodeScanningAlertState?
    public var commitSha: String?
    public var message: Message?
    /// Describe a region within a file for the alert.
    public var location: CodeScanningAlertLocation?
    public var htmlURL: String?
    /// Classifications that have been applied to the file that triggered the alert.
    /// For example identifying it as documentation, or a generated file.
    public var classifications: [CodeScanningAlertClassification]?

    public struct Message: Codable {
        public var text: String?

        public init(text: String? = nil) {
            self.text = text
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.text = try values.decodeIfPresent(String.self, forKey: "text")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(text, forKey: "text")
        }
    }

    public init(ref: String? = nil, analysisKey: String? = nil, environment: String? = nil, category: String? = nil, state: CodeScanningAlertState? = nil, commitSha: String? = nil, message: Message? = nil, location: CodeScanningAlertLocation? = nil, htmlURL: String? = nil, classifications: [CodeScanningAlertClassification]? = nil) {
        self.ref = ref
        self.analysisKey = analysisKey
        self.environment = environment
        self.category = category
        self.state = state
        self.commitSha = commitSha
        self.message = message
        self.location = location
        self.htmlURL = htmlURL
        self.classifications = classifications
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ref = try values.decodeIfPresent(String.self, forKey: "ref")
        self.analysisKey = try values.decodeIfPresent(String.self, forKey: "analysis_key")
        self.environment = try values.decodeIfPresent(String.self, forKey: "environment")
        self.category = try values.decodeIfPresent(String.self, forKey: "category")
        self.state = try values.decodeIfPresent(CodeScanningAlertState.self, forKey: "state")
        self.commitSha = try values.decodeIfPresent(String.self, forKey: "commit_sha")
        self.message = try values.decodeIfPresent(Message.self, forKey: "message")
        self.location = try values.decodeIfPresent(CodeScanningAlertLocation.self, forKey: "location")
        self.htmlURL = try values.decodeIfPresent(String.self, forKey: "html_url")
        self.classifications = try values.decodeIfPresent([CodeScanningAlertClassification].self, forKey: "classifications")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(ref, forKey: "ref")
        try values.encodeIfPresent(analysisKey, forKey: "analysis_key")
        try values.encodeIfPresent(environment, forKey: "environment")
        try values.encodeIfPresent(category, forKey: "category")
        try values.encodeIfPresent(state, forKey: "state")
        try values.encodeIfPresent(commitSha, forKey: "commit_sha")
        try values.encodeIfPresent(message, forKey: "message")
        try values.encodeIfPresent(location, forKey: "location")
        try values.encodeIfPresent(htmlURL, forKey: "html_url")
        try values.encodeIfPresent(classifications, forKey: "classifications")
    }
}
