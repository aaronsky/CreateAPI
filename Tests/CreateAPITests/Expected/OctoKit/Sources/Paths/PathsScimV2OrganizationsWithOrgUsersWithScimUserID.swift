// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Scim.V2.Organizations.WithOrg.Users {
    public func scimUserID(_ scimUserID: String) -> WithScimUserID {
        WithScimUserID(path: "\(path)/\(scimUserID)")
    }

    public struct WithScimUserID {
        /// Path: `/scim/v2/organizations/{org}/Users/{scim_user_id}`
        public let path: String

        /// Get SCIM provisioning information for a user
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/scim#get-scim-provisioning-information-for-a-user)
        public var get: Request<OctoKit.ScimUser> {
            Request(method: "GET", url: path, id: "scim/get-provisioning-information-for-user")
        }

        /// Update a provisioned organization membership
        ///
        /// Replaces an existing provisioned user's information. You must provide all the information required for the user as if you were provisioning them for the first time. Any existing user information that you don't provide will be removed. If you want to only update a specific attribute, use the [Update an attribute for a SCIM user](https://docs.github.com/rest/reference/scim#update-an-attribute-for-a-scim-user) endpoint instead.
        /// 
        /// You must at least provide the required values for the user: `userName`, `name`, and `emails`.
        /// 
        /// **Warning:** Setting `active: false` removes the user from the organization, deletes the external identity, and deletes the associated `{scim_user_id}`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/scim#set-scim-information-for-a-provisioned-user)
        public func put(_ body: PutRequest) -> Request<OctoKit.ScimUser> {
            Request(method: "PUT", url: path, body: body, id: "scim/set-information-for-provisioned-user")
        }

        public struct PutRequest: Encodable {
            public var schemas: [String]?
            /// The name of the user, suitable for display to end-users
            ///
            /// Example: "Jon Doe"
            public var displayName: String?
            public var externalID: String?
            public var groups: [String]?
            public var isActive: Bool?
            /// Configured by the admin. Could be an email, login, or username
            ///
            /// Example: "someone@example.com"
            public var userName: String
            /// Example:
            ///
            /// {
            ///   "familyName" : "User",
            ///   "givenName" : "Jane"
            /// }
            public var name: Name
            /// User emails
            ///
            /// Example:
            ///
            /// [
            ///   {
            ///     "primary" : true,
            ///     "value" : "someone@example.com"
            ///   },
            ///   {
            ///     "primary" : false,
            ///     "value" : "another@example.com"
            ///   }
            /// ]
            public var emails: [Email]

            /// Example:
            ///
            /// {
            ///   "familyName" : "User",
            ///   "givenName" : "Jane"
            /// }
            public struct Name: Encodable {
                public var givenName: String
                public var familyName: String
                public var formatted: String?

                public init(givenName: String, familyName: String, formatted: String? = nil) {
                    self.givenName = givenName
                    self.familyName = familyName
                    self.formatted = formatted
                }
            }

            public struct Email: Encodable {
                public var type: String?
                public var value: String
                public var isPrimary: Bool?

                public init(type: String? = nil, value: String, isPrimary: Bool? = nil) {
                    self.type = type
                    self.value = value
                    self.isPrimary = isPrimary
                }

                private enum CodingKeys: String, CodingKey {
                    case type
                    case value
                    case isPrimary = "primary"
                }
            }

            public init(schemas: [String]? = nil, displayName: String? = nil, externalID: String? = nil, groups: [String]? = nil, isActive: Bool? = nil, userName: String, name: Name, emails: [Email]) {
                self.schemas = schemas
                self.displayName = displayName
                self.externalID = externalID
                self.groups = groups
                self.isActive = isActive
                self.userName = userName
                self.name = name
                self.emails = emails
            }

            private enum CodingKeys: String, CodingKey {
                case schemas
                case displayName
                case externalID = "externalId"
                case groups
                case isActive = "active"
                case userName
                case name
                case emails
            }
        }

        /// Update an attribute for a SCIM user
        ///
        /// Allows you to change a provisioned user's individual attributes. To change a user's values, you must provide a specific `Operations` JSON format that contains at least one of the `add`, `remove`, or `replace` operations. For examples and more information on the SCIM operations format, see the [SCIM specification](https://tools.ietf.org/html/rfc7644#section-3.5.2).
        /// 
        /// **Note:** Complicated SCIM `path` selectors that include filters are not supported. For example, a `path` selector defined as `"path": "emails[type eq \"work\"]"` will not work.
        /// 
        /// **Warning:** If you set `active:false` using the `replace` operation (as shown in the JSON example below), it removes the user from the organization, deletes the external identity, and deletes the associated `:scim_user_id`.
        /// 
        /// ```
        /// {
        ///   "Operations":[{
        ///     "op":"replace",
        ///     "value":{
        ///       "active":false
        ///     }
        ///   }]
        /// }
        /// ```
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/scim#update-an-attribute-for-a-scim-user)
        public func patch(_ body: PatchRequest) -> Request<OctoKit.ScimUser> {
            Request(method: "PATCH", url: path, body: body, id: "scim/update-attribute-for-user")
        }

        public struct PatchRequest: Encodable {
            public var schemas: [String]?
            /// Set of operations to be performed
            ///
            /// Example:
            ///
            /// [
            ///   {
            ///     "op" : "replace",
            ///     "value" : {
            ///       "active" : false
            ///     }
            ///   }
            /// ]
            public var operations: [Operation]

            public struct Operation: Encodable {
                public var op: Op
                public var path: String?
                public var value: Value?

                public enum Op: String, Codable, CaseIterable {
                    case add
                    case remove
                    case replace
                }

                public enum Value: Encodable {
                    case object(Object)
                    case placeholderItems([PlaceholderItem])
                    case string(String)

                    public struct Object: Encodable {
                        public var isActive: Bool?
                        public var userName: String?
                        public var externalID: String?
                        public var givenName: String?
                        public var familyName: String?

                        public init(isActive: Bool? = nil, userName: String? = nil, externalID: String? = nil, givenName: String? = nil, familyName: String? = nil) {
                            self.isActive = isActive
                            self.userName = userName
                            self.externalID = externalID
                            self.givenName = givenName
                            self.familyName = familyName
                        }

                        private enum CodingKeys: String, CodingKey {
                            case isActive = "active"
                            case userName
                            case externalID = "externalId"
                            case givenName
                            case familyName
                        }
                    }

                    public struct PlaceholderItem: Encodable {
                        public var value: String?
                        public var isPrimary: Bool?

                        public init(value: String? = nil, isPrimary: Bool? = nil) {
                            self.value = value
                            self.isPrimary = isPrimary
                        }

                        private enum CodingKeys: String, CodingKey {
                            case value
                            case isPrimary = "primary"
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.singleValueContainer()
                        switch self {
                        case .object(let value): try container.encode(value)
                        case .placeholderItems(let value): try container.encode(value)
                        case .string(let value): try container.encode(value)
                        }
                    }
                }

                public init(op: Op, path: String? = nil, value: Value? = nil) {
                    self.op = op
                    self.path = path
                    self.value = value
                }
            }

            public init(schemas: [String]? = nil, operations: [Operation]) {
                self.schemas = schemas
                self.operations = operations
            }

            private enum CodingKeys: String, CodingKey {
                case schemas
                case operations = "Operations"
            }
        }

        /// Delete a SCIM user from an organization
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/scim#delete-a-scim-user-from-an-organization)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "scim/delete-user-from-org")
        }
    }
}
