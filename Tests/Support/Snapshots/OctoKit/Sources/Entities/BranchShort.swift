// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct BranchShort: Codable {
    public var name: String
    public var commit: Commit
    public var isProtected: Bool

    public struct Commit: Codable {
        public var sha: String
        public var url: String

        public init(sha: String, url: String) {
            self.sha = sha
            self.url = url
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.sha = try values.decode(String.self, forKey: "sha")
            self.url = try values.decode(String.self, forKey: "url")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(sha, forKey: "sha")
            try values.encode(url, forKey: "url")
        }
    }

    public init(name: String, commit: Commit, isProtected: Bool) {
        self.name = name
        self.commit = commit
        self.isProtected = isProtected
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "name")
        self.commit = try values.decode(Commit.self, forKey: "commit")
        self.isProtected = try values.decode(Bool.self, forKey: "protected")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "name")
        try values.encode(commit, forKey: "commit")
        try values.encode(isProtected, forKey: "protected")
    }
}
