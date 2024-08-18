// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Store: Codable {
    public var pets: Pets

    public init(pets: Pets) {
        self.pets = pets
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.pets = try values.decode(Pets.self, forKey: "pets")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(pets, forKey: "pets")
    }
}
