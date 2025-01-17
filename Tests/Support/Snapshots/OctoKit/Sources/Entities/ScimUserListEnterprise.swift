// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ScimUserListEnterprise: Codable {
    public var schemas: [String]
    public var totalResults: Double
    public var itemsPerPage: Double
    public var startIndex: Double
    public var resources: [Resource]

    public struct Resource: Codable {
        public var schemas: [String]
        public var id: String
        public var externalID: String?
        public var userName: String?
        public var name: Name?
        public var emails: [Email]?
        public var groups: [Group]?
        public var isActive: Bool?
        public var meta: Meta?

        public struct Name: Codable {
            public var givenName: String?
            public var familyName: String?

            public init(givenName: String? = nil, familyName: String? = nil) {
                self.givenName = givenName
                self.familyName = familyName
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.givenName = try values.decodeIfPresent(String.self, forKey: "givenName")
                self.familyName = try values.decodeIfPresent(String.self, forKey: "familyName")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(givenName, forKey: "givenName")
                try values.encodeIfPresent(familyName, forKey: "familyName")
            }
        }

        public struct Email: Codable {
            public var value: String?
            public var isPrimary: Bool?
            public var type: String?

            public init(value: String? = nil, isPrimary: Bool? = nil, type: String? = nil) {
                self.value = value
                self.isPrimary = isPrimary
                self.type = type
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.value = try values.decodeIfPresent(String.self, forKey: "value")
                self.isPrimary = try values.decodeIfPresent(Bool.self, forKey: "primary")
                self.type = try values.decodeIfPresent(String.self, forKey: "type")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(value, forKey: "value")
                try values.encodeIfPresent(isPrimary, forKey: "primary")
                try values.encodeIfPresent(type, forKey: "type")
            }
        }

        public struct Group: Codable {
            public var value: String?

            public init(value: String? = nil) {
                self.value = value
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.value = try values.decodeIfPresent(String.self, forKey: "value")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(value, forKey: "value")
            }
        }

        public struct Meta: Codable {
            public var resourceType: String?
            public var created: String?
            public var lastModified: String?
            public var location: String?

            public init(resourceType: String? = nil, created: String? = nil, lastModified: String? = nil, location: String? = nil) {
                self.resourceType = resourceType
                self.created = created
                self.lastModified = lastModified
                self.location = location
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.resourceType = try values.decodeIfPresent(String.self, forKey: "resourceType")
                self.created = try values.decodeIfPresent(String.self, forKey: "created")
                self.lastModified = try values.decodeIfPresent(String.self, forKey: "lastModified")
                self.location = try values.decodeIfPresent(String.self, forKey: "location")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(resourceType, forKey: "resourceType")
                try values.encodeIfPresent(created, forKey: "created")
                try values.encodeIfPresent(lastModified, forKey: "lastModified")
                try values.encodeIfPresent(location, forKey: "location")
            }
        }

        public init(schemas: [String], id: String, externalID: String? = nil, userName: String? = nil, name: Name? = nil, emails: [Email]? = nil, groups: [Group]? = nil, isActive: Bool? = nil, meta: Meta? = nil) {
            self.schemas = schemas
            self.id = id
            self.externalID = externalID
            self.userName = userName
            self.name = name
            self.emails = emails
            self.groups = groups
            self.isActive = isActive
            self.meta = meta
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.schemas = try values.decode([String].self, forKey: "schemas")
            self.id = try values.decode(String.self, forKey: "id")
            self.externalID = try values.decodeIfPresent(String.self, forKey: "externalId")
            self.userName = try values.decodeIfPresent(String.self, forKey: "userName")
            self.name = try values.decodeIfPresent(Name.self, forKey: "name")
            self.emails = try values.decodeIfPresent([Email].self, forKey: "emails")
            self.groups = try values.decodeIfPresent([Group].self, forKey: "groups")
            self.isActive = try values.decodeIfPresent(Bool.self, forKey: "active")
            self.meta = try values.decodeIfPresent(Meta.self, forKey: "meta")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(schemas, forKey: "schemas")
            try values.encode(id, forKey: "id")
            try values.encodeIfPresent(externalID, forKey: "externalId")
            try values.encodeIfPresent(userName, forKey: "userName")
            try values.encodeIfPresent(name, forKey: "name")
            try values.encodeIfPresent(emails, forKey: "emails")
            try values.encodeIfPresent(groups, forKey: "groups")
            try values.encodeIfPresent(isActive, forKey: "active")
            try values.encodeIfPresent(meta, forKey: "meta")
        }
    }

    public init(schemas: [String], totalResults: Double, itemsPerPage: Double, startIndex: Double, resources: [Resource]) {
        self.schemas = schemas
        self.totalResults = totalResults
        self.itemsPerPage = itemsPerPage
        self.startIndex = startIndex
        self.resources = resources
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.schemas = try values.decode([String].self, forKey: "schemas")
        self.totalResults = try values.decode(Double.self, forKey: "totalResults")
        self.itemsPerPage = try values.decode(Double.self, forKey: "itemsPerPage")
        self.startIndex = try values.decode(Double.self, forKey: "startIndex")
        self.resources = try values.decode([Resource].self, forKey: "Resources")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(schemas, forKey: "schemas")
        try values.encode(totalResults, forKey: "totalResults")
        try values.encode(itemsPerPage, forKey: "itemsPerPage")
        try values.encode(startIndex, forKey: "startIndex")
        try values.encode(resources, forKey: "Resources")
    }
}
