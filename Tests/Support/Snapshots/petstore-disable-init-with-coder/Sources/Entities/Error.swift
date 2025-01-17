// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Error: Codable {
    public var code: Int32
    public var message: String

    public init(code: Int32, message: String) {
        self.code = code
        self.message = message
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(code, forKey: "code")
        try values.encode(message, forKey: "message")
    }
}
