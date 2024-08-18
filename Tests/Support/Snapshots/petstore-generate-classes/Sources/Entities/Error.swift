// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public final class Error: Codable {
    public let code: Int32
    public let message: String

    public init(code: Int32, message: String) {
        self.code = code
        self.message = message
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.code = try values.decode(Int32.self, forKey: "code")
        self.message = try values.decode(String.self, forKey: "message")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(code, forKey: "code")
        try values.encode(message, forKey: "message")
    }
}
