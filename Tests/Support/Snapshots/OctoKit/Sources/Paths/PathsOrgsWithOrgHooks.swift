// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var hooks: Hooks {
        Hooks(path: path + "/hooks")
    }

    public struct Hooks {
        /// Path: `/orgs/{org}/hooks`
        public let path: String

        /// List organization webhooks
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-organization-webhooks)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.OrgHook]> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "orgs/list-webhooks")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }

        /// Create an organization webhook
        ///
        /// Here's how you can create a hook that posts payloads in JSON format:
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#create-an-organization-webhook)
        public func post(_ body: PostRequest) -> Request<OctoKit.OrgHook> {
            Request(path: path, method: "POST", body: body, id: "orgs/create-webhook")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// Must be passed as "web".
            public var name: String
            /// Key/value pairs to provide settings for this webhook. [These are defined below](https://docs.github.com/rest/reference/orgs#create-hook-config-params).
            public var config: Config
            /// Determines what [events](https://docs.github.com/webhooks/event-payloads) the hook is triggered for.
            public var events: [String]?
            /// Determines if notifications are sent when the webhook is triggered. Set to `true` to send notifications.
            public var isActive: Bool?

            /// Key/value pairs to provide settings for this webhook. [These are defined below](https://docs.github.com/rest/reference/orgs#create-hook-config-params).
            public struct Config: Encodable {
                /// The URL to which the payloads will be delivered.
                ///
                /// Example: "https://example.com/webhook"
                public var url: URL
                /// The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
                ///
                /// Example: "json"
                public var contentType: String?
                /// If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
                ///
                /// Example: "********"
                public var secret: String?
                public var insecureSSL: OctoKit.WebhookConfigInsecureSSL?
                /// Example: "kdaigle"
                public var username: String?
                /// Example: "password"
                public var password: String?

                public init(url: URL, contentType: String? = nil, secret: String? = nil, insecureSSL: OctoKit.WebhookConfigInsecureSSL? = nil, username: String? = nil, password: String? = nil) {
                    self.url = url
                    self.contentType = contentType
                    self.secret = secret
                    self.insecureSSL = insecureSSL
                    self.username = username
                    self.password = password
                }

                public func encode(to encoder: any Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(url, forKey: "url")
                    try values.encodeIfPresent(contentType, forKey: "content_type")
                    try values.encodeIfPresent(secret, forKey: "secret")
                    try values.encodeIfPresent(insecureSSL, forKey: "insecure_ssl")
                    try values.encodeIfPresent(username, forKey: "username")
                    try values.encodeIfPresent(password, forKey: "password")
                }
            }

            public init(name: String, config: Config, events: [String]? = ["push"], isActive: Bool? = true) {
                self.name = name
                self.config = config
                self.events = events
                self.isActive = isActive
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(name, forKey: "name")
                try values.encode(config, forKey: "config")
                try values.encodeIfPresent(events, forKey: "events")
                try values.encodeIfPresent(isActive, forKey: "active")
            }
        }
    }
}
