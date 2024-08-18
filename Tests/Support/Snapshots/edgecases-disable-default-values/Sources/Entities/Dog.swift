// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Dog: Codable {
    public var className: String
    public var color: String?
    public var breed: Breed?
    public var image: Image?
    public var goodBoy: GoodBoy
    public var family: Family?

    public enum Breed: String, CaseIterable, Codable {
        case large = "Large"
        case medium = "Medium"
        case small = "Small"
    }

    public enum GoodBoy: String, CaseIterable, Codable {
        case yes
    }

    public enum Family: String, CaseIterable, Codable {
        case canine
    }

    public init(className: String, color: String?, breed: Breed?, image: Image?, goodBoy: GoodBoy, family: Family?) {
        self.className = className
        self.color = color
        self.breed = breed
        self.image = image
        self.goodBoy = goodBoy
        self.family = family
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.className = try values.decode(String.self, forKey: "className")
        self.color = try values.decodeIfPresent(String.self, forKey: "color")
        self.breed = try values.decodeIfPresent(Breed.self, forKey: "breed")
        self.image = try values.decodeIfPresent(Image.self, forKey: "image")
        self.goodBoy = try values.decode(GoodBoy.self, forKey: "good_boy")
        self.family = try values.decodeIfPresent(Family.self, forKey: "family")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(className, forKey: "className")
        try values.encodeIfPresent(color, forKey: "color")
        try values.encodeIfPresent(breed, forKey: "breed")
        try values.encodeIfPresent(image, forKey: "image")
        try values.encode(goodBoy, forKey: "good_boy")
        try values.encodeIfPresent(family, forKey: "family")
    }
}
