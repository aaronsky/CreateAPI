// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct FormatTest: Codable {
  public var integer: Int?
  public var int32: Int32?
  public var int64: Int64?
  public var number: Double
  public var float: Float?
  public var double: Double?
  public var string: String?
  public var byte: Data
  public var binary: Data?
  public var uri: URL?
  public var uriReference: String?
  public var uriDefault: URL?
  public var uriRequired: URL
  public var date: NaiveDate
  public var dateTime: Date?
  public var uuid: UUID?
  public var password: String

  public init(integer: Int? = nil, int32: Int32? = nil, int64: Int64? = nil, number: Double, float: Float? = nil, double: Double? = nil, string: String? = nil, byte: Data, binary: Data? = nil, uri: URL? = nil, uriReference: String? = nil, uriDefault: URL? = nil, uriRequired: URL, date: NaiveDate, dateTime: Date? = nil, uuid: UUID? = nil, password: String) {
    self.integer = integer
    self.int32 = int32
    self.int64 = int64
    self.number = number
    self.float = float
    self.double = double
    self.string = string
    self.byte = byte
    self.binary = binary
    self.uri = uri
    self.uriReference = uriReference
    self.uriDefault = uriDefault
    self.uriRequired = uriRequired
    self.date = date
    self.dateTime = dateTime
    self.uuid = uuid
    self.password = password
  }

  public init(from decoder: any Decoder) throws {
    let values = try decoder.container(keyedBy: StringCodingKey.self)
    self.integer = try values.decodeIfPresent(Int.self, forKey: "integer")
    self.int32 = try values.decodeIfPresent(Int32.self, forKey: "int32")
    self.int64 = try values.decodeIfPresent(Int64.self, forKey: "int64")
    self.number = try values.decode(Double.self, forKey: "number")
    self.float = try values.decodeIfPresent(Float.self, forKey: "float")
    self.double = try values.decodeIfPresent(Double.self, forKey: "double")
    self.string = try values.decodeIfPresent(String.self, forKey: "string")
    self.byte = try values.decode(Data.self, forKey: "byte")
    self.binary = try values.decodeIfPresent(Data.self, forKey: "binary")
    self.uri = try values.decodeIfPresent(URL.self, forKey: "uri")
    self.uriReference = try values.decodeIfPresent(String.self, forKey: "uri_reference")
    self.uriDefault = try values.decodeIfPresent(URL.self, forKey: "uri_default")
    self.uriRequired = try values.decode(URL.self, forKey: "uri_required")
    self.date = try values.decode(NaiveDate.self, forKey: "date")
    self.dateTime = try values.decodeIfPresent(Date.self, forKey: "dateTime")
    self.uuid = try values.decodeIfPresent(UUID.self, forKey: "uuid")
    self.password = try values.decode(String.self, forKey: "password")
  }

  public func encode(to encoder: any Encoder) throws {
    var values = encoder.container(keyedBy: StringCodingKey.self)
    try values.encodeIfPresent(integer, forKey: "integer")
    try values.encodeIfPresent(int32, forKey: "int32")
    try values.encodeIfPresent(int64, forKey: "int64")
    try values.encode(number, forKey: "number")
    try values.encodeIfPresent(float, forKey: "float")
    try values.encodeIfPresent(double, forKey: "double")
    try values.encodeIfPresent(string, forKey: "string")
    try values.encode(byte, forKey: "byte")
    try values.encodeIfPresent(binary, forKey: "binary")
    try values.encodeIfPresent(uri, forKey: "uri")
    try values.encodeIfPresent(uriReference, forKey: "uri_reference")
    try values.encodeIfPresent(uriDefault, forKey: "uri_default")
    try values.encode(uriRequired, forKey: "uri_required")
    try values.encode(date, forKey: "date")
    try values.encodeIfPresent(dateTime, forKey: "dateTime")
    try values.encodeIfPresent(uuid, forKey: "uuid")
    try values.encode(password, forKey: "password")
  }
}
