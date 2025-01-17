// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct IssueEventProjectCard: Codable {
    public var url: URL
    public var id: Int
    public var projectURL: URL
    public var projectID: Int
    public var columnName: String
    public var previousColumnName: String?

    public init(url: URL, id: Int, projectURL: URL, projectID: Int, columnName: String, previousColumnName: String? = nil) {
        self.url = url
        self.id = id
        self.projectURL = projectURL
        self.projectID = projectID
        self.columnName = columnName
        self.previousColumnName = previousColumnName
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.id = try values.decode(Int.self, forKey: "id")
        self.projectURL = try values.decode(URL.self, forKey: "project_url")
        self.projectID = try values.decode(Int.self, forKey: "project_id")
        self.columnName = try values.decode(String.self, forKey: "column_name")
        self.previousColumnName = try values.decodeIfPresent(String.self, forKey: "previous_column_name")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(id, forKey: "id")
        try values.encode(projectURL, forKey: "project_url")
        try values.encode(projectID, forKey: "project_id")
        try values.encode(columnName, forKey: "column_name")
        try values.encodeIfPresent(previousColumnName, forKey: "previous_column_name")
    }
}
