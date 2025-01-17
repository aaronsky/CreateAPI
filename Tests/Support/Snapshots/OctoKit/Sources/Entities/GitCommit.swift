// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Low-level Git commit operations within a repository
public struct GitCommit: Codable {
    /// SHA for the commit
    ///
    /// Example: "7638417db6d59f3c431d3e1f261cc637155684cd"
    public var sha: String
    public var nodeID: String
    public var url: URL
    /// Identifying information for the git-user
    public var author: Author
    /// Identifying information for the git-user
    public var committer: Committer
    /// Message describing the purpose of the commit
    ///
    /// Example: "Fix #42"
    public var message: String
    public var tree: Tree
    public var parents: [Parent]
    public var verification: Verification
    public var htmlURL: URL

    /// Identifying information for the git-user
    public struct Author: Codable {
        /// Timestamp of the commit
        ///
        /// Example: "2014-08-09T08:02:04+12:00"
        public var date: Date
        /// Git email address of the user
        ///
        /// Example: "monalisa.octocat@example.com"
        public var email: String
        /// Name of the git user
        ///
        /// Example: "Monalisa Octocat"
        public var name: String

        public init(date: Date, email: String, name: String) {
            self.date = date
            self.email = email
            self.name = name
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.date = try values.decode(Date.self, forKey: "date")
            self.email = try values.decode(String.self, forKey: "email")
            self.name = try values.decode(String.self, forKey: "name")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(date, forKey: "date")
            try values.encode(email, forKey: "email")
            try values.encode(name, forKey: "name")
        }
    }

    /// Identifying information for the git-user
    public struct Committer: Codable {
        /// Timestamp of the commit
        ///
        /// Example: "2014-08-09T08:02:04+12:00"
        public var date: Date
        /// Git email address of the user
        ///
        /// Example: "monalisa.octocat@example.com"
        public var email: String
        /// Name of the git user
        ///
        /// Example: "Monalisa Octocat"
        public var name: String

        public init(date: Date, email: String, name: String) {
            self.date = date
            self.email = email
            self.name = name
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.date = try values.decode(Date.self, forKey: "date")
            self.email = try values.decode(String.self, forKey: "email")
            self.name = try values.decode(String.self, forKey: "name")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(date, forKey: "date")
            try values.encode(email, forKey: "email")
            try values.encode(name, forKey: "name")
        }
    }

    public struct Tree: Codable {
        /// SHA for the commit
        ///
        /// Example: "7638417db6d59f3c431d3e1f261cc637155684cd"
        public var sha: String
        public var url: URL

        public init(sha: String, url: URL) {
            self.sha = sha
            self.url = url
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.sha = try values.decode(String.self, forKey: "sha")
            self.url = try values.decode(URL.self, forKey: "url")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(sha, forKey: "sha")
            try values.encode(url, forKey: "url")
        }
    }

    public struct Parent: Codable {
        /// SHA for the commit
        ///
        /// Example: "7638417db6d59f3c431d3e1f261cc637155684cd"
        public var sha: String
        public var url: URL
        public var htmlURL: URL

        public init(sha: String, url: URL, htmlURL: URL) {
            self.sha = sha
            self.url = url
            self.htmlURL = htmlURL
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.sha = try values.decode(String.self, forKey: "sha")
            self.url = try values.decode(URL.self, forKey: "url")
            self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(sha, forKey: "sha")
            try values.encode(url, forKey: "url")
            try values.encode(htmlURL, forKey: "html_url")
        }
    }

    public struct Verification: Codable {
        public var isVerified: Bool
        public var reason: String
        public var signature: String?
        public var payload: String?

        public init(isVerified: Bool, reason: String, signature: String? = nil, payload: String? = nil) {
            self.isVerified = isVerified
            self.reason = reason
            self.signature = signature
            self.payload = payload
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.isVerified = try values.decode(Bool.self, forKey: "verified")
            self.reason = try values.decode(String.self, forKey: "reason")
            self.signature = try values.decodeIfPresent(String.self, forKey: "signature")
            self.payload = try values.decodeIfPresent(String.self, forKey: "payload")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(isVerified, forKey: "verified")
            try values.encode(reason, forKey: "reason")
            try values.encodeIfPresent(signature, forKey: "signature")
            try values.encodeIfPresent(payload, forKey: "payload")
        }
    }

    public init(sha: String, nodeID: String, url: URL, author: Author, committer: Committer, message: String, tree: Tree, parents: [Parent], verification: Verification, htmlURL: URL) {
        self.sha = sha
        self.nodeID = nodeID
        self.url = url
        self.author = author
        self.committer = committer
        self.message = message
        self.tree = tree
        self.parents = parents
        self.verification = verification
        self.htmlURL = htmlURL
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.sha = try values.decode(String.self, forKey: "sha")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.url = try values.decode(URL.self, forKey: "url")
        self.author = try values.decode(Author.self, forKey: "author")
        self.committer = try values.decode(Committer.self, forKey: "committer")
        self.message = try values.decode(String.self, forKey: "message")
        self.tree = try values.decode(Tree.self, forKey: "tree")
        self.parents = try values.decode([Parent].self, forKey: "parents")
        self.verification = try values.decode(Verification.self, forKey: "verification")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(sha, forKey: "sha")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(url, forKey: "url")
        try values.encode(author, forKey: "author")
        try values.encode(committer, forKey: "committer")
        try values.encode(message, forKey: "message")
        try values.encode(tree, forKey: "tree")
        try values.encode(parents, forKey: "parents")
        try values.encode(verification, forKey: "verification")
        try values.encode(htmlURL, forKey: "html_url")
    }
}
