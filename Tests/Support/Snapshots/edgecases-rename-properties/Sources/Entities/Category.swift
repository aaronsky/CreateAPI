// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Category: Codable {
    public var identifier: Int64?
    public var title: String?

    public init(identifier: Int64? = nil, title: String? = nil) {
        self.identifier = identifier
        self.title = title
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.identifier = try values.decodeIfPresent(Int64.self, forKey: "id")
        self.title = try values.decodeIfPresent(String.self, forKey: "name")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(identifier, forKey: "id")
        try values.encodeIfPresent(title, forKey: "name")
    }
}
