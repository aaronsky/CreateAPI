// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import CoreLocation

public struct Store: Codable {
    public var pets: [Pet]

    public init(pets: [Pet]) {
        self.pets = pets
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.pets = try values.decode([Pet].self, forKey: "pets")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(pets, forKey: "pets")
    }
}
