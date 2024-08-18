// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ArrayOfNumberOnly: Codable {
	public var arrayNumber: [Double]?

	public init(arrayNumber: [Double]? = nil) {
		self.arrayNumber = arrayNumber
	}

	public init(from decoder: any Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.arrayNumber = try values.decodeIfPresent([Double].self, forKey: "ArrayNumber")
	}

	public func encode(to encoder: any Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encodeIfPresent(arrayNumber, forKey: "ArrayNumber")
	}
}
