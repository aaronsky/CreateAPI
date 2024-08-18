// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Webhook Configuration
///
/// Configuration object of the webhook
public struct WebhookConfig: Codable {
    /// The URL to which the payloads will be delivered.
    ///
    /// Example: "https://example.com/webhook"
    public var url: URL?
    /// The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
    ///
    /// Example: "json"
    public var contentType: String?
    /// If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
    ///
    /// Example: "********"
    public var secret: String?
    public var insecureSSL: WebhookConfigInsecureSSL?

    public init(url: URL? = nil, contentType: String? = nil, secret: String? = nil, insecureSSL: WebhookConfigInsecureSSL? = nil) {
        self.url = url
        self.contentType = contentType
        self.secret = secret
        self.insecureSSL = insecureSSL
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decodeIfPresent(URL.self, forKey: "url")
        self.contentType = try values.decodeIfPresent(String.self, forKey: "content_type")
        self.secret = try values.decodeIfPresent(String.self, forKey: "secret")
        self.insecureSSL = try values.decodeIfPresent(WebhookConfigInsecureSSL.self, forKey: "insecure_ssl")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(contentType, forKey: "content_type")
        try values.encodeIfPresent(secret, forKey: "secret")
        try values.encodeIfPresent(insecureSSL, forKey: "insecure_ssl")
    }
}
