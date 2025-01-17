// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct CommunityProfile: Codable {
    /// Example: 100
    public var healthPercentage: Int
    /// Example: "My first repository on GitHub!"
    public var description: String?
    /// Example: "example.com"
    public var documentation: String?
    public var files: Files
    /// Example: "2017-02-28T19:09:29Z"
    public var updatedAt: Date?
    /// Example: true
    public var isContentReportsEnabled: Bool?

    public struct Files: Codable {
        /// Code Of Conduct Simple
        ///
        /// Code of Conduct Simple
        public var codeOfConduct: CodeOfConductSimple?
        /// Community Health File
        public var codeOfConductFile: CommunityHealthFile?
        /// License Simple
        public var license: LicenseSimple?
        /// Community Health File
        public var contributing: CommunityHealthFile?
        /// Community Health File
        public var readme: CommunityHealthFile?
        /// Community Health File
        public var issueTemplate: CommunityHealthFile?
        /// Community Health File
        public var pullRequestTemplate: CommunityHealthFile?

        public init(codeOfConduct: CodeOfConductSimple? = nil, codeOfConductFile: CommunityHealthFile? = nil, license: LicenseSimple? = nil, contributing: CommunityHealthFile? = nil, readme: CommunityHealthFile? = nil, issueTemplate: CommunityHealthFile? = nil, pullRequestTemplate: CommunityHealthFile? = nil) {
            self.codeOfConduct = codeOfConduct
            self.codeOfConductFile = codeOfConductFile
            self.license = license
            self.contributing = contributing
            self.readme = readme
            self.issueTemplate = issueTemplate
            self.pullRequestTemplate = pullRequestTemplate
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.codeOfConduct = try values.decodeIfPresent(CodeOfConductSimple.self, forKey: "code_of_conduct")
            self.codeOfConductFile = try values.decodeIfPresent(CommunityHealthFile.self, forKey: "code_of_conduct_file")
            self.license = try values.decodeIfPresent(LicenseSimple.self, forKey: "license")
            self.contributing = try values.decodeIfPresent(CommunityHealthFile.self, forKey: "contributing")
            self.readme = try values.decodeIfPresent(CommunityHealthFile.self, forKey: "readme")
            self.issueTemplate = try values.decodeIfPresent(CommunityHealthFile.self, forKey: "issue_template")
            self.pullRequestTemplate = try values.decodeIfPresent(CommunityHealthFile.self, forKey: "pull_request_template")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(codeOfConduct, forKey: "code_of_conduct")
            try values.encodeIfPresent(codeOfConductFile, forKey: "code_of_conduct_file")
            try values.encodeIfPresent(license, forKey: "license")
            try values.encodeIfPresent(contributing, forKey: "contributing")
            try values.encodeIfPresent(readme, forKey: "readme")
            try values.encodeIfPresent(issueTemplate, forKey: "issue_template")
            try values.encodeIfPresent(pullRequestTemplate, forKey: "pull_request_template")
        }
    }

    public init(healthPercentage: Int, description: String? = nil, documentation: String? = nil, files: Files, updatedAt: Date? = nil, isContentReportsEnabled: Bool? = nil) {
        self.healthPercentage = healthPercentage
        self.description = description
        self.documentation = documentation
        self.files = files
        self.updatedAt = updatedAt
        self.isContentReportsEnabled = isContentReportsEnabled
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.healthPercentage = try values.decode(Int.self, forKey: "health_percentage")
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.documentation = try values.decodeIfPresent(String.self, forKey: "documentation")
        self.files = try values.decode(Files.self, forKey: "files")
        self.updatedAt = try values.decodeIfPresent(Date.self, forKey: "updated_at")
        self.isContentReportsEnabled = try values.decodeIfPresent(Bool.self, forKey: "content_reports_enabled")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(healthPercentage, forKey: "health_percentage")
        try values.encodeIfPresent(description, forKey: "description")
        try values.encodeIfPresent(documentation, forKey: "documentation")
        try values.encode(files, forKey: "files")
        try values.encodeIfPresent(updatedAt, forKey: "updated_at")
        try values.encodeIfPresent(isContentReportsEnabled, forKey: "content_reports_enabled")
    }
}
