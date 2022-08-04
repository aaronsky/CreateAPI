// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Hooks.WithHookID {
    public var config: Config {
        Config(path: path + "/config")
    }

    public struct Config {
        /// Path: `/repos/{owner}/{repo}/hooks/{hook_id}/config`
        public let path: String

        /// Get a webhook configuration for a repository
        ///
        /// Returns the webhook configuration for a repository. To get more information about the webhook, including the `active` state and `events`, use "[Get a repository webhook](/rest/reference/orgs#get-a-repository-webhook)."
        /// 
        /// Access tokens must have the `read:repo_hook` or `repo` scope, and GitHub Apps must have the `repository_hooks:read` permission.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-a-webhook-configuration-for-a-repository)
        public var get: Request<OctoKit.WebhookConfig> {
            Request(method: "GET", url: path, id: "repos/get-webhook-config-for-repo")
        }

        /// Update a webhook configuration for a repository
        ///
        /// Updates the webhook configuration for a repository. To update more information about the webhook, including the `active` state and `events`, use "[Update a repository webhook](/rest/reference/orgs#update-a-repository-webhook)."
        /// 
        /// Access tokens must have the `write:repo_hook` or `repo` scope, and GitHub Apps must have the `repository_hooks:write` permission.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#update-a-webhook-configuration-for-a-repository)
        public func patch(_ body: PatchRequest? = nil) -> Request<OctoKit.WebhookConfig> {
            Request(method: "PATCH", url: path, body: body, id: "repos/update-webhook-config-for-repo")
        }

        /// Example:
        ///
        /// {
        ///   "content_type" : "json",
        ///   "insecure_ssl" : "0",
        ///   "secret" : "********",
        ///   "url" : "https:\/\/example.com\/webhook"
        /// }
        public struct PatchRequest: Encodable {
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
            public var insecureSSL: OctoKit.WebhookConfigInsecureSSL?

            public init(url: URL? = nil, contentType: String? = nil, secret: String? = nil, insecureSSL: OctoKit.WebhookConfigInsecureSSL? = nil) {
                self.url = url
                self.contentType = contentType
                self.secret = secret
                self.insecureSSL = insecureSSL
            }

            private enum CodingKeys: String, CodingKey {
                case url
                case contentType = "content_type"
                case secret
                case insecureSSL = "insecure_ssl"
            }
        }
    }
}
