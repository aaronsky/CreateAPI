// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Enterprises.WithEnterprise {
    public var auditLog: AuditLog {
        AuditLog(path: path + "/audit-log")
    }

    public struct AuditLog {
        /// Path: `/enterprises/{enterprise}/audit-log`
        public let path: String

        /// Get the audit log for an enterprise
        ///
        /// Gets the audit log for an enterprise. To use this endpoint, you must be an enterprise admin, and you must use an access token with the `admin:enterprise` scope.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#get-the-audit-log-for-an-enterprise)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.AuditLogEvent]> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "enterprise-admin/get-audit-log")
        }

        public struct GetParameters {
            public var phrase: String?
            public var include: Include?
            public var after: String?
            public var before: String?
            public var order: Order?
            public var page: Int?
            public var perPage: Int?

            public enum Include: String, CaseIterable, Codable {
                case web
                case git
                case all
            }

            public enum Order: String, CaseIterable, Codable {
                case desc
                case asc
            }

            public init(phrase: String? = nil, include: Include? = nil, after: String? = nil, before: String? = nil, order: Order? = nil, page: Int? = nil, perPage: Int? = nil) {
                self.phrase = phrase
                self.include = include
                self.after = after
                self.before = before
                self.order = order
                self.page = page
                self.perPage = perPage
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(phrase, forKey: "phrase")
                encoder.encode(include, forKey: "include")
                encoder.encode(after, forKey: "after")
                encoder.encode(before, forKey: "before")
                encoder.encode(order, forKey: "order")
                encoder.encode(page, forKey: "page")
                encoder.encode(perPage, forKey: "per_page")
                return encoder.items
            }
        }
    }
}
