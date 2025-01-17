// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Self hosted runners
///
/// A self hosted runner
public struct Runner: Codable {
    /// The id of the runner.
    public var id: Int
    /// The name of the runner.
    ///
    /// Example: "iMac"
    public var name: String
    /// The Operating System of the runner.
    ///
    /// Example: "macos"
    public var os: String
    /// The status of the runner.
    ///
    /// Example: "online"
    public var status: String
    public var isBusy: Bool
    public var labels: [RunnerLabel]

    public init(id: Int, name: String, os: String, status: String, isBusy: Bool, labels: [RunnerLabel]) {
        self.id = id
        self.name = name
        self.os = os
        self.status = status
        self.isBusy = isBusy
        self.labels = labels
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.os = try values.decode(String.self, forKey: "os")
        self.status = try values.decode(String.self, forKey: "status")
        self.isBusy = try values.decode(Bool.self, forKey: "busy")
        self.labels = try values.decode([RunnerLabel].self, forKey: "labels")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(os, forKey: "os")
        try values.encode(status, forKey: "status")
        try values.encode(isBusy, forKey: "busy")
        try values.encode(labels, forKey: "labels")
    }
}
