// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Error: Codable, Identifiable {
    public var id: Int32
    public var message: String

    public init(id: Int32, message: String) {
        self.id = id
        self.message = message
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int32.self, forKey: "code")
        self.message = try values.decode(String.self, forKey: "message")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "code")
        try values.encode(message, forKey: "message")
    }
}
