// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Person: Codable {
    public var name: String
    public var address: String?

    public init(name: String, address: String? = nil) {
        self.name = name
        self.address = address
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "name")
        self.address = try values.decodeIfPresent(String.self, forKey: "address")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "name")
        try values.encodeIfPresent(address, forKey: "address")
    }
}
