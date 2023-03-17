// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

struct Dog: Codable {
    var className: String
    var color: String?
    var breed: Breed?
    var image: Image?
    var goodBoy: GoodBoy
    var family: Family?

    enum Breed: String, CaseIterable, Codable {
        case large = "Large"
        case medium = "Medium"
        case small = "Small"
    }

    enum GoodBoy: String, Codable, CaseIterable {
        case yes
    }

    enum Family: String, Codable, CaseIterable {
        case canine
    }

    init(className: String, color: String? = "red", breed: Breed? = nil, image: Image? = nil, goodBoy: GoodBoy = .yes, family: Family? = nil) {
        self.className = className
        self.color = color
        self.breed = breed
        self.image = image
        self.goodBoy = goodBoy
        self.family = family
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.className = try values.decode(String.self, forKey: "className")
        self.color = try values.decodeIfPresent(String.self, forKey: "color")
        self.breed = try values.decodeIfPresent(Breed.self, forKey: "breed")
        self.image = try values.decodeIfPresent(Image.self, forKey: "image")
        self.goodBoy = try values.decode(GoodBoy.self, forKey: "good_boy")
        self.family = try values.decodeIfPresent(Family.self, forKey: "family")
    }

    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(className, forKey: "className")
        try values.encodeIfPresent(color, forKey: "color")
        try values.encodeIfPresent(breed, forKey: "breed")
        try values.encodeIfPresent(image, forKey: "image")
        try values.encode(goodBoy, forKey: "good_boy")
        try values.encodeIfPresent(family, forKey: "family")
    }
}
