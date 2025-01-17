// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Deployment
///
/// A deployment created as the result of an Actions check run from a workflow that references an environment
public struct DeploymentSimple: Codable {
    /// Example: "https://api.github.com/repos/octocat/example/deployments/1"
    public var url: URL
    /// Unique identifier of the deployment
    ///
    /// Example: 42
    public var id: Int
    /// Example: "MDEwOkRlcGxveW1lbnQx"
    public var nodeID: String
    /// Parameter to specify a task to execute
    ///
    /// Example: "deploy"
    public var task: String
    /// Example: "staging"
    public var originalEnvironment: String?
    /// Name for the target deployment environment.
    ///
    /// Example: "production"
    public var environment: String
    /// Example: "Deploy request from hubot"
    public var description: String?
    /// Example: "2012-07-20T01:19:13Z"
    public var createdAt: Date
    /// Example: "2012-07-20T01:19:13Z"
    public var updatedAt: Date
    /// Example: "https://api.github.com/repos/octocat/example/deployments/1/statuses"
    public var statusesURL: URL
    /// Example: "https://api.github.com/repos/octocat/example"
    public var repositoryURL: URL
    /// Specifies if the given environment is will no longer exist at some point in the future. Default: false.
    ///
    /// Example: true
    public var isTransientEnvironment: Bool?
    /// Specifies if the given environment is one that end-users directly interact with. Default: false.
    ///
    /// Example: true
    public var isProductionEnvironment: Bool?
    /// GitHub app
    ///
    /// GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    public var performedViaGithubApp: Integration?

    public init(url: URL, id: Int, nodeID: String, task: String, originalEnvironment: String? = nil, environment: String, description: String? = nil, createdAt: Date, updatedAt: Date, statusesURL: URL, repositoryURL: URL, isTransientEnvironment: Bool? = nil, isProductionEnvironment: Bool? = nil, performedViaGithubApp: Integration? = nil) {
        self.url = url
        self.id = id
        self.nodeID = nodeID
        self.task = task
        self.originalEnvironment = originalEnvironment
        self.environment = environment
        self.description = description
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.statusesURL = statusesURL
        self.repositoryURL = repositoryURL
        self.isTransientEnvironment = isTransientEnvironment
        self.isProductionEnvironment = isProductionEnvironment
        self.performedViaGithubApp = performedViaGithubApp
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.task = try values.decode(String.self, forKey: "task")
        self.originalEnvironment = try values.decodeIfPresent(String.self, forKey: "original_environment")
        self.environment = try values.decode(String.self, forKey: "environment")
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.statusesURL = try values.decode(URL.self, forKey: "statuses_url")
        self.repositoryURL = try values.decode(URL.self, forKey: "repository_url")
        self.isTransientEnvironment = try values.decodeIfPresent(Bool.self, forKey: "transient_environment")
        self.isProductionEnvironment = try values.decodeIfPresent(Bool.self, forKey: "production_environment")
        self.performedViaGithubApp = try values.decodeIfPresent(Integration.self, forKey: "performed_via_github_app")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(task, forKey: "task")
        try values.encodeIfPresent(originalEnvironment, forKey: "original_environment")
        try values.encode(environment, forKey: "environment")
        try values.encodeIfPresent(description, forKey: "description")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encode(statusesURL, forKey: "statuses_url")
        try values.encode(repositoryURL, forKey: "repository_url")
        try values.encodeIfPresent(isTransientEnvironment, forKey: "transient_environment")
        try values.encodeIfPresent(isProductionEnvironment, forKey: "production_environment")
        try values.encodeIfPresent(performedViaGithubApp, forKey: "performed_via_github_app")
    }
}
