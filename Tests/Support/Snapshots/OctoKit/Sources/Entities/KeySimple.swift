// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct KeySimple: Codable {
    public var id: Int
    public var key: String

    public init(id: Int, key: String) {
        self.id = id
        self.key = key
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.key = try values.decode(String.self, forKey: "key")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(key, forKey: "key")
    }
}
