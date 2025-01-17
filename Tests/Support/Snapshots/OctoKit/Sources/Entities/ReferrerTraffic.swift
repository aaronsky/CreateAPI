// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ReferrerTraffic: Codable {
    /// Example: "Google"
    public var referrer: String
    public var count: Int
    public var uniques: Int

    public init(referrer: String, count: Int, uniques: Int) {
        self.referrer = referrer
        self.count = count
        self.uniques = uniques
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.referrer = try values.decode(String.self, forKey: "referrer")
        self.count = try values.decode(Int.self, forKey: "count")
        self.uniques = try values.decode(Int.self, forKey: "uniques")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(referrer, forKey: "referrer")
        try values.encode(count, forKey: "count")
        try values.encode(uniques, forKey: "uniques")
    }
}
