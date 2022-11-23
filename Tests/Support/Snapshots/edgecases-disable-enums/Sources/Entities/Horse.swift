// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Model for testing models with weird enum properties
public struct Horse: Codable {
    public var className: String
    public var color: String?
    public var birthday: String
    public var strength: String?
    public var legCount: Int?

    public init(className: String, color: String? = "red", birthday: String, strength: String? = nil, legCount: Int? = nil) {
        self.className = className
        self.color = color
        self.birthday = birthday
        self.strength = strength
        self.legCount = legCount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.className = try values.decode(String.self, forKey: "className")
        self.color = try values.decodeIfPresent(String.self, forKey: "color") ?? "red"
        self.birthday = try values.decode(String.self, forKey: "birthday")
        self.strength = try values.decodeIfPresent(String.self, forKey: "strength")
        self.legCount = try values.decodeIfPresent(Int.self, forKey: "legCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(className, forKey: "className")
        try values.encodeIfPresent(color, forKey: "color")
        try values.encode(birthday, forKey: "birthday")
        try values.encodeIfPresent(strength, forKey: "strength")
        try values.encodeIfPresent(legCount, forKey: "legCount")
    }
}
