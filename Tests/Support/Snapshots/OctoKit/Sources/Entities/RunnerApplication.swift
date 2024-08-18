// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct RunnerApplication: Codable {
    public var os: String
    public var architecture: String
    public var downloadURL: String
    public var filename: String
    /// A short lived bearer token used to download the runner, if needed.
    public var tempDownloadToken: String?
    public var sha256Checksum: String?

    public init(os: String, architecture: String, downloadURL: String, filename: String, tempDownloadToken: String? = nil, sha256Checksum: String? = nil) {
        self.os = os
        self.architecture = architecture
        self.downloadURL = downloadURL
        self.filename = filename
        self.tempDownloadToken = tempDownloadToken
        self.sha256Checksum = sha256Checksum
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.os = try values.decode(String.self, forKey: "os")
        self.architecture = try values.decode(String.self, forKey: "architecture")
        self.downloadURL = try values.decode(String.self, forKey: "download_url")
        self.filename = try values.decode(String.self, forKey: "filename")
        self.tempDownloadToken = try values.decodeIfPresent(String.self, forKey: "temp_download_token")
        self.sha256Checksum = try values.decodeIfPresent(String.self, forKey: "sha256_checksum")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(os, forKey: "os")
        try values.encode(architecture, forKey: "architecture")
        try values.encode(downloadURL, forKey: "download_url")
        try values.encode(filename, forKey: "filename")
        try values.encodeIfPresent(tempDownloadToken, forKey: "temp_download_token")
        try values.encodeIfPresent(sha256Checksum, forKey: "sha256_checksum")
    }
}
