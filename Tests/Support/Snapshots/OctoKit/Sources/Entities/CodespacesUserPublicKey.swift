// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// The public key used for setting user Codespaces' Secrets.
public struct CodespacesUserPublicKey: Codable {
    /// The identifier for the key.
    ///
    /// Example: "1234567"
    public var keyID: String
    /// The Base64 encoded public key.
    ///
    /// Example: "hBT5WZEj8ZoOv6TYJsfWq7MxTEQopZO5/IT3ZCVQPzs="
    public var key: String

    public init(keyID: String, key: String) {
        self.keyID = keyID
        self.key = key
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.keyID = try values.decode(String.self, forKey: "key_id")
        self.key = try values.decode(String.self, forKey: "key")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(keyID, forKey: "key_id")
        try values.encode(key, forKey: "key")
    }
}
