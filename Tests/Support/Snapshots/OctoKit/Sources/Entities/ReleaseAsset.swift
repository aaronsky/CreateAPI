// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Data related to a release.
public struct ReleaseAsset: Codable {
    public var url: URL
    public var browserDownloadURL: URL
    public var id: Int
    public var nodeID: String
    /// The file name of the asset.
    ///
    /// Example: "Team Environment"
    public var name: String
    public var label: String?
    /// State of the release asset.
    public var state: State
    public var contentType: String
    public var size: Int
    public var downloadCount: Int
    public var createdAt: Date
    public var updatedAt: Date
    /// Simple User
    public var uploader: SimpleUser?

    /// State of the release asset.
    public enum State: String, CaseIterable, Codable {
        case uploaded
        case `open`
    }

    public init(url: URL, browserDownloadURL: URL, id: Int, nodeID: String, name: String, label: String? = nil, state: State, contentType: String, size: Int, downloadCount: Int, createdAt: Date, updatedAt: Date, uploader: SimpleUser? = nil) {
        self.url = url
        self.browserDownloadURL = browserDownloadURL
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.label = label
        self.state = state
        self.contentType = contentType
        self.size = size
        self.downloadCount = downloadCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.uploader = uploader
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.browserDownloadURL = try values.decode(URL.self, forKey: "browser_download_url")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.name = try values.decode(String.self, forKey: "name")
        self.label = try values.decodeIfPresent(String.self, forKey: "label")
        self.state = try values.decode(State.self, forKey: "state")
        self.contentType = try values.decode(String.self, forKey: "content_type")
        self.size = try values.decode(Int.self, forKey: "size")
        self.downloadCount = try values.decode(Int.self, forKey: "download_count")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.uploader = try values.decodeIfPresent(SimpleUser.self, forKey: "uploader")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(browserDownloadURL, forKey: "browser_download_url")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(name, forKey: "name")
        try values.encodeIfPresent(label, forKey: "label")
        try values.encode(state, forKey: "state")
        try values.encode(contentType, forKey: "content_type")
        try values.encode(size, forKey: "size")
        try values.encode(downloadCount, forKey: "download_count")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encodeIfPresent(uploader, forKey: "uploader")
    }
}
