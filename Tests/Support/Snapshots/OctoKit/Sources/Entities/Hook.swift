// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Webhook
///
/// Webhooks for repositories.
public struct Hook: Codable {
    public var type: String
    /// Unique identifier of the webhook.
    ///
    /// Example: 42
    public var id: Int
    /// The name of a valid service, use 'web' for a webhook.
    ///
    /// Example: "web"
    public var name: String
    /// Determines whether the hook is actually triggered on pushes.
    ///
    /// Example: true
    public var isActive: Bool
    /// Determines what events the hook is triggered for. Default: ['push'].
    ///
    /// Example: ["push", "pull_request"]
    public var events: [String]
    public var config: Config
    /// Example: "2011-09-06T20:39:23Z"
    public var updatedAt: Date
    /// Example: "2011-09-06T17:26:27Z"
    public var createdAt: Date
    /// Example: "https://api.github.com/repos/octocat/Hello-World/hooks/1"
    public var url: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/hooks/1/test"
    public var testURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/hooks/1/pings"
    public var pingURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/hooks/1/deliveries"
    public var deliveriesURL: URL?
    /// Hook Response
    public var lastResponse: HookResponse

    public struct Config: Codable {
        /// Example: "foo@bar.com"
        public var email: String?
        /// Example: "foo"
        public var password: String?
        /// Example: "roomer"
        public var room: String?
        /// Example: "foo"
        public var subdomain: String?
        /// The URL to which the payloads will be delivered.
        ///
        /// Example: "https://example.com/webhook"
        public var url: URL?
        public var insecureSSL: WebhookConfigInsecureSSL?
        /// The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
        ///
        /// Example: "json"
        public var contentType: String?
        /// Example: "sha256"
        public var digest: String?
        /// If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
        ///
        /// Example: "********"
        public var secret: String?
        /// Example: "abc"
        public var token: String?

        public init(email: String? = nil, password: String? = nil, room: String? = nil, subdomain: String? = nil, url: URL? = nil, insecureSSL: WebhookConfigInsecureSSL? = nil, contentType: String? = nil, digest: String? = nil, secret: String? = nil, token: String? = nil) {
            self.email = email
            self.password = password
            self.room = room
            self.subdomain = subdomain
            self.url = url
            self.insecureSSL = insecureSSL
            self.contentType = contentType
            self.digest = digest
            self.secret = secret
            self.token = token
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.email = try values.decodeIfPresent(String.self, forKey: "email")
            self.password = try values.decodeIfPresent(String.self, forKey: "password")
            self.room = try values.decodeIfPresent(String.self, forKey: "room")
            self.subdomain = try values.decodeIfPresent(String.self, forKey: "subdomain")
            self.url = try values.decodeIfPresent(URL.self, forKey: "url")
            self.insecureSSL = try values.decodeIfPresent(WebhookConfigInsecureSSL.self, forKey: "insecure_ssl")
            self.contentType = try values.decodeIfPresent(String.self, forKey: "content_type")
            self.digest = try values.decodeIfPresent(String.self, forKey: "digest")
            self.secret = try values.decodeIfPresent(String.self, forKey: "secret")
            self.token = try values.decodeIfPresent(String.self, forKey: "token")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(email, forKey: "email")
            try values.encodeIfPresent(password, forKey: "password")
            try values.encodeIfPresent(room, forKey: "room")
            try values.encodeIfPresent(subdomain, forKey: "subdomain")
            try values.encodeIfPresent(url, forKey: "url")
            try values.encodeIfPresent(insecureSSL, forKey: "insecure_ssl")
            try values.encodeIfPresent(contentType, forKey: "content_type")
            try values.encodeIfPresent(digest, forKey: "digest")
            try values.encodeIfPresent(secret, forKey: "secret")
            try values.encodeIfPresent(token, forKey: "token")
        }
    }

    public init(type: String, id: Int, name: String, isActive: Bool, events: [String], config: Config, updatedAt: Date, createdAt: Date, url: URL, testURL: URL, pingURL: URL, deliveriesURL: URL? = nil, lastResponse: HookResponse) {
        self.type = type
        self.id = id
        self.name = name
        self.isActive = isActive
        self.events = events
        self.config = config
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.url = url
        self.testURL = testURL
        self.pingURL = pingURL
        self.deliveriesURL = deliveriesURL
        self.lastResponse = lastResponse
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(String.self, forKey: "type")
        self.id = try values.decode(Int.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.isActive = try values.decode(Bool.self, forKey: "active")
        self.events = try values.decode([String].self, forKey: "events")
        self.config = try values.decode(Config.self, forKey: "config")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.url = try values.decode(URL.self, forKey: "url")
        self.testURL = try values.decode(URL.self, forKey: "test_url")
        self.pingURL = try values.decode(URL.self, forKey: "ping_url")
        self.deliveriesURL = try values.decodeIfPresent(URL.self, forKey: "deliveries_url")
        self.lastResponse = try values.decode(HookResponse.self, forKey: "last_response")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(isActive, forKey: "active")
        try values.encode(events, forKey: "events")
        try values.encode(config, forKey: "config")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(url, forKey: "url")
        try values.encode(testURL, forKey: "test_url")
        try values.encode(pingURL, forKey: "ping_url")
        try values.encodeIfPresent(deliveriesURL, forKey: "deliveries_url")
        try values.encode(lastResponse, forKey: "last_response")
    }
}
