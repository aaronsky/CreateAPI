// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct User: Codable {
	public var id: Int64?
	public var username: String?
	public var firstName: String?
	public var lastName: String?
	public var email: String?
	public var password: String?
	public var phone: String?
	/// User Status
	public var userStatus: Int32?

	public init(id: Int64? = nil, username: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, password: String? = nil, phone: String? = nil, userStatus: Int32? = nil) {
		self.id = id
		self.username = username
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.password = password
		self.phone = phone
		self.userStatus = userStatus
	}

	public init(from decoder: any Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.id = try values.decodeIfPresent(Int64.self, forKey: "id")
		self.username = try values.decodeIfPresent(String.self, forKey: "username")
		self.firstName = try values.decodeIfPresent(String.self, forKey: "firstName")
		self.lastName = try values.decodeIfPresent(String.self, forKey: "lastName")
		self.email = try values.decodeIfPresent(String.self, forKey: "email")
		self.password = try values.decodeIfPresent(String.self, forKey: "password")
		self.phone = try values.decodeIfPresent(String.self, forKey: "phone")
		self.userStatus = try values.decodeIfPresent(Int32.self, forKey: "userStatus")
	}

	public func encode(to encoder: any Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encodeIfPresent(id, forKey: "id")
		try values.encodeIfPresent(username, forKey: "username")
		try values.encodeIfPresent(firstName, forKey: "firstName")
		try values.encodeIfPresent(lastName, forKey: "lastName")
		try values.encodeIfPresent(email, forKey: "email")
		try values.encodeIfPresent(password, forKey: "password")
		try values.encodeIfPresent(phone, forKey: "phone")
		try values.encodeIfPresent(userStatus, forKey: "userStatus")
	}
}
