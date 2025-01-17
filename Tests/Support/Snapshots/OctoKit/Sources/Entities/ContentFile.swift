// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ContentFile: Codable {
    public var type: String
    public var encoding: String
    public var size: Int
    public var name: String
    public var path: String
    public var content: String
    public var sha: String
    public var url: URL
    public var gitURL: URL?
    public var htmlURL: URL?
    public var downloadURL: URL?
    public var links: Links
    /// Example: "actual/actual.md"
    public var target: String?
    /// Example: "git://example.com/defunkt/dotjs.git"
    public var submoduleGitURL: String?

    public struct Links: Codable {
        public var git: URL?
        public var html: URL?
        public var this: URL

        public init(git: URL? = nil, html: URL? = nil, this: URL) {
            self.git = git
            self.html = html
            self.this = this
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.git = try values.decodeIfPresent(URL.self, forKey: "git")
            self.html = try values.decodeIfPresent(URL.self, forKey: "html")
            self.this = try values.decode(URL.self, forKey: "self")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(git, forKey: "git")
            try values.encodeIfPresent(html, forKey: "html")
            try values.encode(this, forKey: "self")
        }
    }

    public init(type: String, encoding: String, size: Int, name: String, path: String, content: String, sha: String, url: URL, gitURL: URL? = nil, htmlURL: URL? = nil, downloadURL: URL? = nil, links: Links, target: String? = nil, submoduleGitURL: String? = nil) {
        self.type = type
        self.encoding = encoding
        self.size = size
        self.name = name
        self.path = path
        self.content = content
        self.sha = sha
        self.url = url
        self.gitURL = gitURL
        self.htmlURL = htmlURL
        self.downloadURL = downloadURL
        self.links = links
        self.target = target
        self.submoduleGitURL = submoduleGitURL
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(String.self, forKey: "type")
        self.encoding = try values.decode(String.self, forKey: "encoding")
        self.size = try values.decode(Int.self, forKey: "size")
        self.name = try values.decode(String.self, forKey: "name")
        self.path = try values.decode(String.self, forKey: "path")
        self.content = try values.decode(String.self, forKey: "content")
        self.sha = try values.decode(String.self, forKey: "sha")
        self.url = try values.decode(URL.self, forKey: "url")
        self.gitURL = try values.decodeIfPresent(URL.self, forKey: "git_url")
        self.htmlURL = try values.decodeIfPresent(URL.self, forKey: "html_url")
        self.downloadURL = try values.decodeIfPresent(URL.self, forKey: "download_url")
        self.links = try values.decode(Links.self, forKey: "_links")
        self.target = try values.decodeIfPresent(String.self, forKey: "target")
        self.submoduleGitURL = try values.decodeIfPresent(String.self, forKey: "submodule_git_url")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encode(encoding, forKey: "encoding")
        try values.encode(size, forKey: "size")
        try values.encode(name, forKey: "name")
        try values.encode(path, forKey: "path")
        try values.encode(content, forKey: "content")
        try values.encode(sha, forKey: "sha")
        try values.encode(url, forKey: "url")
        try values.encodeIfPresent(gitURL, forKey: "git_url")
        try values.encodeIfPresent(htmlURL, forKey: "html_url")
        try values.encodeIfPresent(downloadURL, forKey: "download_url")
        try values.encode(links, forKey: "_links")
        try values.encodeIfPresent(target, forKey: "target")
        try values.encodeIfPresent(submoduleGitURL, forKey: "submodule_git_url")
    }
}
