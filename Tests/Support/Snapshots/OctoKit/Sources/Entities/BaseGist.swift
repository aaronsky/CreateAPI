// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct BaseGist: Codable {
    public var url: URL
    public var forksURL: URL
    public var commitsURL: URL
    public var id: String
    public var nodeID: String
    public var gitPullURL: URL
    public var gitPushURL: URL
    public var htmlURL: URL
    public var files: [String: File]
    public var isPublic: Bool
    public var createdAt: Date
    public var updatedAt: Date
    public var description: String?
    public var comments: Int
    /// Simple User
    public var user: SimpleUser?
    public var commentsURL: URL
    /// Simple User
    public var owner: SimpleUser?
    public var isTruncated: Bool?
    public var forks: [AnyJSON]?
    public var history: [AnyJSON]?

    public struct File: Codable {
        public var filename: String?
        public var type: String?
        public var language: String?
        public var rawURL: String?
        public var size: Int?

        public init(filename: String? = nil, type: String? = nil, language: String? = nil, rawURL: String? = nil, size: Int? = nil) {
            self.filename = filename
            self.type = type
            self.language = language
            self.rawURL = rawURL
            self.size = size
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.filename = try values.decodeIfPresent(String.self, forKey: "filename")
            self.type = try values.decodeIfPresent(String.self, forKey: "type")
            self.language = try values.decodeIfPresent(String.self, forKey: "language")
            self.rawURL = try values.decodeIfPresent(String.self, forKey: "raw_url")
            self.size = try values.decodeIfPresent(Int.self, forKey: "size")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(filename, forKey: "filename")
            try values.encodeIfPresent(type, forKey: "type")
            try values.encodeIfPresent(language, forKey: "language")
            try values.encodeIfPresent(rawURL, forKey: "raw_url")
            try values.encodeIfPresent(size, forKey: "size")
        }
    }

    public init(url: URL, forksURL: URL, commitsURL: URL, id: String, nodeID: String, gitPullURL: URL, gitPushURL: URL, htmlURL: URL, files: [String: File], isPublic: Bool, createdAt: Date, updatedAt: Date, description: String? = nil, comments: Int, user: SimpleUser? = nil, commentsURL: URL, owner: SimpleUser? = nil, isTruncated: Bool? = nil, forks: [AnyJSON]? = nil, history: [AnyJSON]? = nil) {
        self.url = url
        self.forksURL = forksURL
        self.commitsURL = commitsURL
        self.id = id
        self.nodeID = nodeID
        self.gitPullURL = gitPullURL
        self.gitPushURL = gitPushURL
        self.htmlURL = htmlURL
        self.files = files
        self.isPublic = isPublic
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.description = description
        self.comments = comments
        self.user = user
        self.commentsURL = commentsURL
        self.owner = owner
        self.isTruncated = isTruncated
        self.forks = forks
        self.history = history
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.forksURL = try values.decode(URL.self, forKey: "forks_url")
        self.commitsURL = try values.decode(URL.self, forKey: "commits_url")
        self.id = try values.decode(String.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.gitPullURL = try values.decode(URL.self, forKey: "git_pull_url")
        self.gitPushURL = try values.decode(URL.self, forKey: "git_push_url")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        self.files = try values.decode([String: File].self, forKey: "files")
        self.isPublic = try values.decode(Bool.self, forKey: "public")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.comments = try values.decode(Int.self, forKey: "comments")
        self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
        self.commentsURL = try values.decode(URL.self, forKey: "comments_url")
        self.owner = try values.decodeIfPresent(SimpleUser.self, forKey: "owner")
        self.isTruncated = try values.decodeIfPresent(Bool.self, forKey: "truncated")
        self.forks = try values.decodeIfPresent([AnyJSON].self, forKey: "forks")
        self.history = try values.decodeIfPresent([AnyJSON].self, forKey: "history")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(forksURL, forKey: "forks_url")
        try values.encode(commitsURL, forKey: "commits_url")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(gitPullURL, forKey: "git_pull_url")
        try values.encode(gitPushURL, forKey: "git_push_url")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(files, forKey: "files")
        try values.encode(isPublic, forKey: "public")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encodeIfPresent(description, forKey: "description")
        try values.encode(comments, forKey: "comments")
        try values.encodeIfPresent(user, forKey: "user")
        try values.encode(commentsURL, forKey: "comments_url")
        try values.encodeIfPresent(owner, forKey: "owner")
        try values.encodeIfPresent(isTruncated, forKey: "truncated")
        try values.encodeIfPresent(forks, forKey: "forks")
        try values.encodeIfPresent(history, forKey: "history")
    }
}
