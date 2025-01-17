// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct MapTest: Codable {
	public var mapMapOfString: [String: [String: String]]?
	public var mapOfEnumString: [String: MapOfEnumStringItem]?

	public enum MapOfEnumStringItem: String, CaseIterable, Codable {
		case upper = "UPPER"
		case lower
	}

	public init(mapMapOfString: [String: [String: String]]? = nil, mapOfEnumString: [String: MapOfEnumStringItem]? = nil) {
		self.mapMapOfString = mapMapOfString
		self.mapOfEnumString = mapOfEnumString
	}

	public init(from decoder: any Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.mapMapOfString = try values.decodeIfPresent([String: [String: String]].self, forKey: "map_map_of_string")
		self.mapOfEnumString = try values.decodeIfPresent([String: MapOfEnumStringItem].self, forKey: "map_of_enum_string")
	}

	public func encode(to encoder: any Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encodeIfPresent(mapMapOfString, forKey: "map_map_of_string")
		try values.encodeIfPresent(mapOfEnumString, forKey: "map_of_enum_string")
	}
}
