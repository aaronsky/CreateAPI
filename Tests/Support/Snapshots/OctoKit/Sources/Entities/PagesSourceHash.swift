// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct PagesSourceHash: Codable {
    public var branch: String
    public var path: String

    public init(branch: String, path: String) {
        self.branch = branch
        self.path = path
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.branch = try values.decode(String.self, forKey: "branch")
        self.path = try values.decode(String.self, forKey: "path")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(branch, forKey: "branch")
        try values.encode(path, forKey: "path")
    }
}
