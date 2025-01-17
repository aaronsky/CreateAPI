// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// The authorization for an OAuth app, GitHub App, or a Personal Access Token.
public struct Authorization: Codable {
    public var id: Int
    public var url: URL
    /// A list of scopes that this authorization is in.
    public var scopes: [String]?
    public var token: String
    public var tokenLastEight: String?
    public var hashedToken: String?
    public var app: App
    public var note: String?
    public var noteURL: URL?
    public var updatedAt: Date
    public var createdAt: Date
    public var fingerprint: String?
    /// Simple User
    public var user: SimpleUser?
    /// Scoped Installation
    public var installation: ScopedInstallation?
    public var expiresAt: Date?

    public struct App: Codable {
        public var clientID: String
        public var name: String
        public var url: URL

        public init(clientID: String, name: String, url: URL) {
            self.clientID = clientID
            self.name = name
            self.url = url
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.clientID = try values.decode(String.self, forKey: "client_id")
            self.name = try values.decode(String.self, forKey: "name")
            self.url = try values.decode(URL.self, forKey: "url")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(clientID, forKey: "client_id")
            try values.encode(name, forKey: "name")
            try values.encode(url, forKey: "url")
        }
    }

    public init(id: Int, url: URL, scopes: [String]? = nil, token: String, tokenLastEight: String? = nil, hashedToken: String? = nil, app: App, note: String? = nil, noteURL: URL? = nil, updatedAt: Date, createdAt: Date, fingerprint: String? = nil, user: SimpleUser? = nil, installation: ScopedInstallation? = nil, expiresAt: Date? = nil) {
        self.id = id
        self.url = url
        self.scopes = scopes
        self.token = token
        self.tokenLastEight = tokenLastEight
        self.hashedToken = hashedToken
        self.app = app
        self.note = note
        self.noteURL = noteURL
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.fingerprint = fingerprint
        self.user = user
        self.installation = installation
        self.expiresAt = expiresAt
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.url = try values.decode(URL.self, forKey: "url")
        self.scopes = try values.decodeIfPresent([String].self, forKey: "scopes")
        self.token = try values.decode(String.self, forKey: "token")
        self.tokenLastEight = try values.decodeIfPresent(String.self, forKey: "token_last_eight")
        self.hashedToken = try values.decodeIfPresent(String.self, forKey: "hashed_token")
        self.app = try values.decode(App.self, forKey: "app")
        self.note = try values.decodeIfPresent(String.self, forKey: "note")
        self.noteURL = try values.decodeIfPresent(URL.self, forKey: "note_url")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.fingerprint = try values.decodeIfPresent(String.self, forKey: "fingerprint")
        self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
        self.installation = try values.decodeIfPresent(ScopedInstallation.self, forKey: "installation")
        self.expiresAt = try values.decodeIfPresent(Date.self, forKey: "expires_at")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(url, forKey: "url")
        try values.encodeIfPresent(scopes, forKey: "scopes")
        try values.encode(token, forKey: "token")
        try values.encodeIfPresent(tokenLastEight, forKey: "token_last_eight")
        try values.encodeIfPresent(hashedToken, forKey: "hashed_token")
        try values.encode(app, forKey: "app")
        try values.encodeIfPresent(note, forKey: "note")
        try values.encodeIfPresent(noteURL, forKey: "note_url")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encode(createdAt, forKey: "created_at")
        try values.encodeIfPresent(fingerprint, forKey: "fingerprint")
        try values.encodeIfPresent(user, forKey: "user")
        try values.encodeIfPresent(installation, forKey: "installation")
        try values.encodeIfPresent(expiresAt, forKey: "expires_at")
    }
}
