// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Actor: Codable {
    public var id: Int
    public var login: String
    public var displayLogin: String?
    public var gravatarID: String?
    public var url: URL
    public var avatarURL: URL

    public init(id: Int, login: String, displayLogin: String? = nil, gravatarID: String? = nil, url: URL, avatarURL: URL) {
        self.id = id
        self.login = login
        self.displayLogin = displayLogin
        self.gravatarID = gravatarID
        self.url = url
        self.avatarURL = avatarURL
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.login = try values.decode(String.self, forKey: "login")
        self.displayLogin = try values.decodeIfPresent(String.self, forKey: "display_login")
        self.gravatarID = try values.decodeIfPresent(String.self, forKey: "gravatar_id")
        self.url = try values.decode(URL.self, forKey: "url")
        self.avatarURL = try values.decode(URL.self, forKey: "avatar_url")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(login, forKey: "login")
        try values.encodeIfPresent(displayLogin, forKey: "display_login")
        try values.encodeIfPresent(gravatarID, forKey: "gravatar_id")
        try values.encode(url, forKey: "url")
        try values.encode(avatarURL, forKey: "avatar_url")
    }
}
