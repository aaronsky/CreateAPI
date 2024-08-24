// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var fake: Fake {
        Fake(path: "/fake")
    }

    public struct Fake {
        /// Path: `/fake`
        public let path: String

        /// To test enum parameters
        public func get(parameters: GetParameters? = nil) -> Request<Void> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "testEnumParameters")
        }

        public struct GetParameters {
            public var enumQueryStringArray: [EnumQueryStringArray]?
            public var enumQueryString: EnumQueryString?
            public var enumQueryInteger: Int32?

            public enum EnumQueryStringArray: String, CaseIterable, Codable {
                case greaterThan = ">"
                case dollar = "$"
            }

            public enum EnumQueryString: String, CaseIterable, Codable {
                case abc = "_abc"
                case minusEfg = "-efg"
                case xyz = "(xyz)"
            }

            public init(enumQueryStringArray: [EnumQueryStringArray]? = nil, enumQueryString: EnumQueryString? = nil, enumQueryInteger: Int32? = nil) {
                self.enumQueryStringArray = enumQueryStringArray
                self.enumQueryString = enumQueryString
                self.enumQueryInteger = enumQueryInteger
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(enumQueryStringArray, forKey: "enum_query_string_array")
                encoder.encode(enumQueryString, forKey: "enum_query_string")
                encoder.encode(enumQueryInteger, forKey: "enum_query_integer")
                return encoder.items
            }
        }

        /// Fake endpoint for testing various parameters
        public func post(_ body: PostRequest? = nil) -> Request<Void> {
            Request(path: path, method: "POST", body: body.map(URLQueryEncoder.encode)?.percentEncodedQuery, id: "testEndpointParameters")
        }

        public struct PostRequest: Encodable {
            /// None
            public var integer: Int?
            /// None
            public var int32: Int32?
            /// None
            public var int64: Int64?
            /// None
            public var number: Double
            /// None
            public var float: Float?
            /// None
            public var double: Double
            /// None
            public var string: String?
            /// None
            public var patternWithoutDelimiter: String
            /// None
            public var byte: Data
            /// None
            public var binary: Data?
            /// None
            public var date: NaiveDate?
            /// None
            public var dateTime: Date?
            /// None
            public var password: String?
            /// None
            public var callback: String?

            public init(integer: Int? = nil, int32: Int32? = nil, int64: Int64? = nil, number: Double, float: Float? = nil, double: Double, string: String? = nil, patternWithoutDelimiter: String, byte: Data, binary: Data? = nil, date: NaiveDate? = nil, dateTime: Date? = nil, password: String? = nil, callback: String? = nil) {
                self.integer = integer
                self.int32 = int32
                self.int64 = int64
                self.number = number
                self.float = float
                self.double = double
                self.string = string
                self.patternWithoutDelimiter = patternWithoutDelimiter
                self.byte = byte
                self.binary = binary
                self.date = date
                self.dateTime = dateTime
                self.password = password
                self.callback = callback
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(integer, forKey: "integer")
                encoder.encode(int32, forKey: "int32")
                encoder.encode(int64, forKey: "int64")
                encoder.encode(number, forKey: "number")
                encoder.encode(float, forKey: "float")
                encoder.encode(double, forKey: "double")
                encoder.encode(string, forKey: "string")
                encoder.encode(patternWithoutDelimiter, forKey: "pattern_without_delimiter")
                encoder.encode(byte, forKey: "byte")
                encoder.encode(binary, forKey: "binary")
                encoder.encode(date, forKey: "date")
                encoder.encode(dateTime, forKey: "dateTime")
                encoder.encode(password, forKey: "password")
                encoder.encode(callback, forKey: "callback")
                return encoder.items
            }
        }

        /// To test "client" model
        public func patch(_ body: edgecases_disable_enums.Client) -> Request<edgecases_disable_enums.Client> {
            Request(path: path, method: "PATCH", body: body, id: "testClientModel")
        }
    }
}
