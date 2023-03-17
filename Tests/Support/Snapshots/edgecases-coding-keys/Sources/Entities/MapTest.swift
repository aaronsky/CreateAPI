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

    private enum CodingKeys: String, CodingKey {
        case mapMapOfString = "map_map_of_string"
        case mapOfEnumString = "map_of_enum_string"
    }
}
