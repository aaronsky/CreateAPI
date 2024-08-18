// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct AdvancedSecurityActiveCommittersUser: Codable {
    public var userLogin: String
    /// Example: "2021-11-03"
    public var lastPushedDate: String

    public init(userLogin: String, lastPushedDate: String) {
        self.userLogin = userLogin
        self.lastPushedDate = lastPushedDate
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.userLogin = try values.decode(String.self, forKey: "user_login")
        self.lastPushedDate = try values.decode(String.self, forKey: "last_pushed_date")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(userLogin, forKey: "user_login")
        try values.encode(lastPushedDate, forKey: "last_pushed_date")
    }
}
