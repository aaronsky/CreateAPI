// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// A repository import from an external source.
public struct Import: Codable {
    public var vcs: String?
    public var useLfs: Bool?
    /// The URL of the originating repository.
    public var vcsURL: String
    public var svcRoot: String?
    public var tfvcProject: String?
    public var status: Status
    public var statusText: String?
    public var failedStep: String?
    public var errorMessage: String?
    public var importPercent: Int?
    public var commitCount: Int?
    public var pushPercent: Int?
    public var hasLargeFiles: Bool?
    public var largeFilesSize: Int?
    public var largeFilesCount: Int?
    public var projectChoices: [ProjectChoice]?
    public var message: String?
    public var authorsCount: Int?
    public var url: URL
    public var htmlURL: URL
    public var authorsURL: URL
    public var repositoryURL: URL
    public var svnRoot: String?

    public enum Status: String, CaseIterable, Codable {
        case auth
        case error
        case `none`
        case detecting
        case choose
        case authFailed = "auth_failed"
        case importing
        case mapping
        case waitingToPush = "waiting_to_push"
        case pushing
        case complete
        case setup
        case unknown
        case detectionFoundMultiple = "detection_found_multiple"
        case detectionFoundNothing = "detection_found_nothing"
        case detectionNeedsAuth = "detection_needs_auth"
    }

    public struct ProjectChoice: Codable {
        public var vcs: String?
        public var tfvcProject: String?
        public var humanName: String?

        public init(vcs: String? = nil, tfvcProject: String? = nil, humanName: String? = nil) {
            self.vcs = vcs
            self.tfvcProject = tfvcProject
            self.humanName = humanName
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.vcs = try values.decodeIfPresent(String.self, forKey: "vcs")
            self.tfvcProject = try values.decodeIfPresent(String.self, forKey: "tfvc_project")
            self.humanName = try values.decodeIfPresent(String.self, forKey: "human_name")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(vcs, forKey: "vcs")
            try values.encodeIfPresent(tfvcProject, forKey: "tfvc_project")
            try values.encodeIfPresent(humanName, forKey: "human_name")
        }
    }

    public init(vcs: String? = nil, useLfs: Bool? = nil, vcsURL: String, svcRoot: String? = nil, tfvcProject: String? = nil, status: Status, statusText: String? = nil, failedStep: String? = nil, errorMessage: String? = nil, importPercent: Int? = nil, commitCount: Int? = nil, pushPercent: Int? = nil, hasLargeFiles: Bool? = nil, largeFilesSize: Int? = nil, largeFilesCount: Int? = nil, projectChoices: [ProjectChoice]? = nil, message: String? = nil, authorsCount: Int? = nil, url: URL, htmlURL: URL, authorsURL: URL, repositoryURL: URL, svnRoot: String? = nil) {
        self.vcs = vcs
        self.useLfs = useLfs
        self.vcsURL = vcsURL
        self.svcRoot = svcRoot
        self.tfvcProject = tfvcProject
        self.status = status
        self.statusText = statusText
        self.failedStep = failedStep
        self.errorMessage = errorMessage
        self.importPercent = importPercent
        self.commitCount = commitCount
        self.pushPercent = pushPercent
        self.hasLargeFiles = hasLargeFiles
        self.largeFilesSize = largeFilesSize
        self.largeFilesCount = largeFilesCount
        self.projectChoices = projectChoices
        self.message = message
        self.authorsCount = authorsCount
        self.url = url
        self.htmlURL = htmlURL
        self.authorsURL = authorsURL
        self.repositoryURL = repositoryURL
        self.svnRoot = svnRoot
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.vcs = try values.decodeIfPresent(String.self, forKey: "vcs")
        self.useLfs = try values.decodeIfPresent(Bool.self, forKey: "use_lfs")
        self.vcsURL = try values.decode(String.self, forKey: "vcs_url")
        self.svcRoot = try values.decodeIfPresent(String.self, forKey: "svc_root")
        self.tfvcProject = try values.decodeIfPresent(String.self, forKey: "tfvc_project")
        self.status = try values.decode(Status.self, forKey: "status")
        self.statusText = try values.decodeIfPresent(String.self, forKey: "status_text")
        self.failedStep = try values.decodeIfPresent(String.self, forKey: "failed_step")
        self.errorMessage = try values.decodeIfPresent(String.self, forKey: "error_message")
        self.importPercent = try values.decodeIfPresent(Int.self, forKey: "import_percent")
        self.commitCount = try values.decodeIfPresent(Int.self, forKey: "commit_count")
        self.pushPercent = try values.decodeIfPresent(Int.self, forKey: "push_percent")
        self.hasLargeFiles = try values.decodeIfPresent(Bool.self, forKey: "has_large_files")
        self.largeFilesSize = try values.decodeIfPresent(Int.self, forKey: "large_files_size")
        self.largeFilesCount = try values.decodeIfPresent(Int.self, forKey: "large_files_count")
        self.projectChoices = try values.decodeIfPresent([ProjectChoice].self, forKey: "project_choices")
        self.message = try values.decodeIfPresent(String.self, forKey: "message")
        self.authorsCount = try values.decodeIfPresent(Int.self, forKey: "authors_count")
        self.url = try values.decode(URL.self, forKey: "url")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        self.authorsURL = try values.decode(URL.self, forKey: "authors_url")
        self.repositoryURL = try values.decode(URL.self, forKey: "repository_url")
        self.svnRoot = try values.decodeIfPresent(String.self, forKey: "svn_root")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(vcs, forKey: "vcs")
        try values.encodeIfPresent(useLfs, forKey: "use_lfs")
        try values.encode(vcsURL, forKey: "vcs_url")
        try values.encodeIfPresent(svcRoot, forKey: "svc_root")
        try values.encodeIfPresent(tfvcProject, forKey: "tfvc_project")
        try values.encode(status, forKey: "status")
        try values.encodeIfPresent(statusText, forKey: "status_text")
        try values.encodeIfPresent(failedStep, forKey: "failed_step")
        try values.encodeIfPresent(errorMessage, forKey: "error_message")
        try values.encodeIfPresent(importPercent, forKey: "import_percent")
        try values.encodeIfPresent(commitCount, forKey: "commit_count")
        try values.encodeIfPresent(pushPercent, forKey: "push_percent")
        try values.encodeIfPresent(hasLargeFiles, forKey: "has_large_files")
        try values.encodeIfPresent(largeFilesSize, forKey: "large_files_size")
        try values.encodeIfPresent(largeFilesCount, forKey: "large_files_count")
        try values.encodeIfPresent(projectChoices, forKey: "project_choices")
        try values.encodeIfPresent(message, forKey: "message")
        try values.encodeIfPresent(authorsCount, forKey: "authors_count")
        try values.encode(url, forKey: "url")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(authorsURL, forKey: "authors_url")
        try values.encode(repositoryURL, forKey: "repository_url")
        try values.encodeIfPresent(svnRoot, forKey: "svn_root")
    }
}
