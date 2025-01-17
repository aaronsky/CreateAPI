// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Metaproperties for Git author/committer information.
public struct GitUser: Codable {
    /// Example: "Chris Wanstrath"
    public var name: String?
    /// Example: "chris@ozmm.org"
    public var email: String?
    /// Example: "2007-10-29T02:42:39.000-07:00"
    public var date: String?

    public init(name: String? = nil, email: String? = nil, date: String? = nil) {
        self.name = name
        self.email = email
        self.date = date
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.email = try values.decodeIfPresent(String.self, forKey: "email")
        self.date = try values.decodeIfPresent(String.self, forKey: "date")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(email, forKey: "email")
        try values.encodeIfPresent(date, forKey: "date")
    }
}
