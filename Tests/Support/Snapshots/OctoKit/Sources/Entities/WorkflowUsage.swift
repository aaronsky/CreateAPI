// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct WorkflowUsage: Codable {
    public var billable: Billable

    public struct Billable: Codable {
        public var ubuntu: Ubuntu?
        public var macos: Macos?
        public var windows: Windows?

        public struct Ubuntu: Codable {
            public var totalMs: Int?

            public init(totalMs: Int? = nil) {
                self.totalMs = totalMs
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalMs = try values.decodeIfPresent(Int.self, forKey: "total_ms")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(totalMs, forKey: "total_ms")
            }
        }

        public struct Macos: Codable {
            public var totalMs: Int?

            public init(totalMs: Int? = nil) {
                self.totalMs = totalMs
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalMs = try values.decodeIfPresent(Int.self, forKey: "total_ms")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(totalMs, forKey: "total_ms")
            }
        }

        public struct Windows: Codable {
            public var totalMs: Int?

            public init(totalMs: Int? = nil) {
                self.totalMs = totalMs
            }

            public init(from decoder: any Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalMs = try values.decodeIfPresent(Int.self, forKey: "total_ms")
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(totalMs, forKey: "total_ms")
            }
        }

        public init(ubuntu: Ubuntu? = nil, macos: Macos? = nil, windows: Windows? = nil) {
            self.ubuntu = ubuntu
            self.macos = macos
            self.windows = windows
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.ubuntu = try values.decodeIfPresent(Ubuntu.self, forKey: "UBUNTU")
            self.macos = try values.decodeIfPresent(Macos.self, forKey: "MACOS")
            self.windows = try values.decodeIfPresent(Windows.self, forKey: "WINDOWS")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(ubuntu, forKey: "UBUNTU")
            try values.encodeIfPresent(macos, forKey: "MACOS")
            try values.encodeIfPresent(windows, forKey: "WINDOWS")
        }
    }

    public init(billable: Billable) {
        self.billable = billable
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.billable = try values.decode(Billable.self, forKey: "billable")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(billable, forKey: "billable")
    }
}
