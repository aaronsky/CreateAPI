// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Container: Codable {
    public var content: Content

    public enum Content: Codable {
        case a(A)
        case b(B)
        case c(C)

        public init(from decoder: any Decoder) throws {

            struct Discriminator: Decodable {
                let kind: String
            }

            let container = try decoder.singleValueContainer()
            let discriminatorValue = try container.decode(Discriminator.self).kind

            switch discriminatorValue {
            case "a": self = .a(try container.decode(A.self))
            case "d": self = .a(try container.decode(A.self))
            case "b": self = .b(try container.decode(B.self))
            case "c": self = .c(try container.decode(C.self))

            default:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Discriminator value '\(discriminatorValue)' does not match any expected values (a, d, b, c)."
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .a(let value): try container.encode(value)
            case .b(let value): try container.encode(value)
            case .c(let value): try container.encode(value)
            }
        }
    }

    public init(content: Content) {
        self.content = content
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.content = try values.decode(Content.self, forKey: "content")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(content, forKey: "content")
    }
}
