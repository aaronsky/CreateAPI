// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct EnumArrays: Codable {
	public var justSymbol: JustSymbol?
	public var arrayEnum: [ArrayEnumItem]?

	public enum JustSymbol: String, CaseIterable, Codable {
		case greaterThanOrEqualTo = ">="
		case dollar = "$"
	}

	public enum ArrayEnumItem: String, CaseIterable, Codable {
		case fish
		case crab
	}

	public init(justSymbol: JustSymbol? = nil, arrayEnum: [ArrayEnumItem]? = nil) {
		self.justSymbol = justSymbol
		self.arrayEnum = arrayEnum
	}

	public init(from decoder: any Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.justSymbol = try values.decodeIfPresent(JustSymbol.self, forKey: "just_symbol")
		self.arrayEnum = try values.decodeIfPresent([ArrayEnumItem].self, forKey: "array_enum")
	}

	public func encode(to encoder: any Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encodeIfPresent(justSymbol, forKey: "just_symbol")
		try values.encodeIfPresent(arrayEnum, forKey: "array_enum")
	}
}
