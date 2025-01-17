// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Category: Codable {
	public var id: Int64?
	public var name: String?

	public init(id: Int64? = nil, name: String? = nil) {
		self.id = id
		self.name = name
	}

	public init(from decoder: any Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.id = try values.decodeIfPresent(Int64.self, forKey: "id")
		self.name = try values.decodeIfPresent(String.self, forKey: "name")
	}

	public func encode(to encoder: any Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encodeIfPresent(id, forKey: "id")
		try values.encodeIfPresent(name, forKey: "name")
	}
}
