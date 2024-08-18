// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct SecretScanningAlert: Codable {
    /// The security alert number.
    public var number: Int?
    /// The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    public var createdAt: Date?
    /// The REST API URL of the alert resource.
    public var url: URL?
    /// The GitHub URL of the alert resource.
    public var htmlURL: URL?
    /// The REST API URL of the code locations for this alert.
    public var locationsURL: URL?
    /// Sets the state of the secret scanning alert. Can be either `open` or `resolved`. You must provide `resolution` when you set the state to `resolved`.
    public var state: SecretScanningAlertState?
    /// **Required when the `state` is `resolved`.** The reason for resolving the alert. Can be one of `false_positive`, `wont_fix`, `revoked`, or `used_in_tests`.
    public var resolution: SecretScanningAlertResolution?
    /// The time that the alert was resolved in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    public var resolvedAt: Date?
    /// Simple User
    public var resolvedBy: SimpleUser?
    /// The type of secret that secret scanning detected.
    public var secretType: String?
    /// The secret that was detected.
    public var secret: String?

    public init(number: Int? = nil, createdAt: Date? = nil, url: URL? = nil, htmlURL: URL? = nil, locationsURL: URL? = nil, state: SecretScanningAlertState? = nil, resolution: SecretScanningAlertResolution? = nil, resolvedAt: Date? = nil, resolvedBy: SimpleUser? = nil, secretType: String? = nil, secret: String? = nil) {
        self.number = number
        self.createdAt = createdAt
        self.url = url
        self.htmlURL = htmlURL
        self.locationsURL = locationsURL
        self.state = state
        self.resolution = resolution
        self.resolvedAt = resolvedAt
        self.resolvedBy = resolvedBy
        self.secretType = secretType
        self.secret = secret
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.number = try values.decodeIfPresent(Int.self, forKey: "number")
        self.createdAt = try values.decodeIfPresent(Date.self, forKey: "created_at")
        self.url = try values.decodeIfPresent(URL.self, forKey: "url")
        self.htmlURL = try values.decodeIfPresent(URL.self, forKey: "html_url")
        self.locationsURL = try values.decodeIfPresent(URL.self, forKey: "locations_url")
        self.state = try values.decodeIfPresent(SecretScanningAlertState.self, forKey: "state")
        self.resolution = try values.decodeIfPresent(SecretScanningAlertResolution.self, forKey: "resolution")
        self.resolvedAt = try values.decodeIfPresent(Date.self, forKey: "resolved_at")
        self.resolvedBy = try values.decodeIfPresent(SimpleUser.self, forKey: "resolved_by")
        self.secretType = try values.decodeIfPresent(String.self, forKey: "secret_type")
        self.secret = try values.decodeIfPresent(String.self, forKey: "secret")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(number, forKey: "number")
        try values.encodeIfPresent(createdAt, forKey: "created_at")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(htmlURL, forKey: "html_url")
        try values.encodeIfPresent(locationsURL, forKey: "locations_url")
        try values.encodeIfPresent(state, forKey: "state")
        try values.encodeIfPresent(resolution, forKey: "resolution")
        try values.encodeIfPresent(resolvedAt, forKey: "resolved_at")
        try values.encodeIfPresent(resolvedBy, forKey: "resolved_by")
        try values.encodeIfPresent(secretType, forKey: "secret_type")
        try values.encodeIfPresent(secret, forKey: "secret")
    }
}
