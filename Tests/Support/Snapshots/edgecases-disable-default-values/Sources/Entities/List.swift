// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct List: Codable {
    public var _123List: String?

    public init(_123List: String?) {
        self._123List = _123List
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self._123List = try values.decodeIfPresent(String.self, forKey: "123-list")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(_123List, forKey: "123-list")
    }
}
