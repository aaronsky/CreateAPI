// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ContributorActivity: Codable {
    /// Simple User
    public var author: SimpleUser?
    /// Example: 135
    public var total: Int
    /// Example:
    ///
    /// [
    ///   {
    ///     "a" : 6898,
    ///     "c" : 10,
    ///     "d" : 77,
    ///     "w" : "1367712000"
    ///   }
    /// ]
    public var weeks: [Week]

    public struct Week: Codable {
        public var w: Int?
        public var a: Int?
        public var d: Int?
        public var c: Int?

        public init(w: Int? = nil, a: Int? = nil, d: Int? = nil, c: Int? = nil) {
            self.w = w
            self.a = a
            self.d = d
            self.c = c
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.w = try values.decodeIfPresent(Int.self, forKey: "w")
            self.a = try values.decodeIfPresent(Int.self, forKey: "a")
            self.d = try values.decodeIfPresent(Int.self, forKey: "d")
            self.c = try values.decodeIfPresent(Int.self, forKey: "c")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(w, forKey: "w")
            try values.encodeIfPresent(a, forKey: "a")
            try values.encodeIfPresent(d, forKey: "d")
            try values.encodeIfPresent(c, forKey: "c")
        }
    }

    public init(author: SimpleUser? = nil, total: Int, weeks: [Week]) {
        self.author = author
        self.total = total
        self.weeks = weeks
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.author = try values.decodeIfPresent(SimpleUser.self, forKey: "author")
        self.total = try values.decode(Int.self, forKey: "total")
        self.weeks = try values.decode([Week].self, forKey: "weeks")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(author, forKey: "author")
        try values.encode(total, forKey: "total")
        try values.encode(weeks, forKey: "weeks")
    }
}
