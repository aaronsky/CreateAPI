// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Hooks {
    public func hookID(_ hookID: Int) -> WithHookID {
        WithHookID(path: "\(path)/\(hookID)")
    }

    public struct WithHookID {
        /// Path: `/repos/{owner}/{repo}/hooks/{hook_id}`
        public let path: String

        /// Get a repository webhook
        ///
        /// Returns a webhook configured in a repository. To get only the webhook `config` properties, see "[Get a webhook configuration for a repository](/rest/reference/repos#get-a-webhook-configuration-for-a-repository)."
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-a-repository-webhook)
        public var get: Request<OctoKit.Hook> {
            Request(path: path, method: "GET", id: "repos/get-webhook")
        }

        /// Update a repository webhook
        ///
        /// Updates a webhook configured in a repository. If you previously had a `secret` set, you must provide the same `secret` or set a new `secret` or the secret will be removed. If you are only updating individual webhook `config` properties, use "[Update a webhook configuration for a repository](/rest/reference/repos#update-a-webhook-configuration-for-a-repository)."
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#update-a-repository-webhook)
        public func patch(_ body: PatchRequest) -> Request<OctoKit.Hook> {
            Request(path: path, method: "PATCH", body: body, id: "repos/update-webhook")
        }

        public struct PatchRequest: Encodable {
            /// Key/value pairs to provide settings for this webhook. [These are defined below](https://docs.github.com/rest/reference/repos#create-hook-config-params).
            public var config: Config?
            /// Determines what [events](https://docs.github.com/webhooks/event-payloads) the hook is triggered for. This replaces the entire array of events.
            public var events: [String]?
            /// Determines a list of events to be added to the list of events that the Hook triggers for.
            public var addEvents: [String]?
            /// Determines a list of events to be removed from the list of events that the Hook triggers for.
            public var removeEvents: [String]?
            /// Determines if notifications are sent when the webhook is triggered. Set to `true` to send notifications.
            public var isActive: Bool?

            /// Key/value pairs to provide settings for this webhook. [These are defined below](https://docs.github.com/rest/reference/repos#create-hook-config-params).
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
                /// Example: "bar@example.com"
                public var address: String?
                /// Example: "The Serious Room"
                public var room: String?

                public init(url: URL, contentType: String? = nil, secret: String? = nil, insecureSSL: OctoKit.WebhookConfigInsecureSSL? = nil, address: String? = nil, room: String? = nil) {
                    self.url = url
                    self.contentType = contentType
                    self.secret = secret
                    self.insecureSSL = insecureSSL
                    self.address = address
                    self.room = room
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(url, forKey: "url")
                    try values.encodeIfPresent(contentType, forKey: "content_type")
                    try values.encodeIfPresent(secret, forKey: "secret")
                    try values.encodeIfPresent(insecureSSL, forKey: "insecure_ssl")
                    try values.encodeIfPresent(address, forKey: "address")
                    try values.encodeIfPresent(room, forKey: "room")
                }
            }

            public init(config: Config? = nil, events: [String]? = nil, addEvents: [String]? = nil, removeEvents: [String]? = nil, isActive: Bool? = true) {
                self.config = config
                self.events = events
                self.addEvents = addEvents
                self.removeEvents = removeEvents
                self.isActive = isActive
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(config, forKey: "config")
                try values.encodeIfPresent(events, forKey: "events")
                try values.encodeIfPresent(addEvents, forKey: "add_events")
                try values.encodeIfPresent(removeEvents, forKey: "remove_events")
                try values.encodeIfPresent(isActive, forKey: "active")
            }
        }

        /// Delete a repository webhook
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#delete-a-repository-webhook)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "repos/delete-webhook")
        }
    }
}
