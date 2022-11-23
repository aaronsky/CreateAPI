// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User {
    public var repos: Repos {
        Repos(path: path + "/repos")
    }

    public struct Repos {
        /// Path: `/user/repos`
        public let path: String

        /// List repositories for the authenticated user
        ///
        /// Lists repositories that the authenticated user has explicit permission (`:read`, `:write`, or `:admin`) to access.
        /// 
        /// The authenticated user has explicit permission to access repositories they own, repositories where they are a collaborator, and repositories that they can access through an organization membership.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-repositories-for-the-authenticated-user)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Repository]> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "repos/list-for-authenticated-user")
        }

        public struct GetParameters {
            public var visibility: Visibility?
            public var affiliation: String?
            public var type: `Type`?
            public var sort: Sort?
            public var direction: Direction?
            public var perPage: Int?
            public var page: Int?
            public var since: Date?
            public var before: Date?

            public enum Visibility: String, Codable, CaseIterable {
                case all
                case `public`
                case `private`
            }

            public enum `Type`: String, Codable, CaseIterable {
                case all
                case owner
                case `public`
                case `private`
                case member
            }

            public enum Sort: String, Codable, CaseIterable {
                case created
                case updated
                case pushed
                case fullName = "full_name"
            }

            public enum Direction: String, Codable, CaseIterable {
                case asc
                case desc
            }

            public init(visibility: Visibility? = nil, affiliation: String? = nil, type: `Type`? = nil, sort: Sort? = nil, direction: Direction? = nil, perPage: Int? = nil, page: Int? = nil, since: Date? = nil, before: Date? = nil) {
                self.visibility = visibility
                self.affiliation = affiliation
                self.type = type
                self.sort = sort
                self.direction = direction
                self.perPage = perPage
                self.page = page
                self.since = since
                self.before = before
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(visibility, forKey: "visibility")
                encoder.encode(affiliation, forKey: "affiliation")
                encoder.encode(type, forKey: "type")
                encoder.encode(sort, forKey: "sort")
                encoder.encode(direction, forKey: "direction")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                encoder.encode(since, forKey: "since")
                encoder.encode(before, forKey: "before")
                return encoder.items
            }
        }

        /// Create a repository for the authenticated user
        ///
        /// Creates a new repository for the authenticated user.
        /// 
        /// **OAuth scope requirements**
        /// 
        /// When using [OAuth](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/), authorizations must include:
        /// 
        /// *   `public_repo` scope or `repo` scope to create a public repository. Note: For GitHub AE, use `repo` scope to create an internal repository.
        /// *   `repo` scope to create a private repository.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#create-a-repository-for-the-authenticated-user)
        public func post(_ body: PostRequest) -> Request<OctoKit.Repository> {
            Request(path: path, method: "POST", body: body, id: "repos/create-for-authenticated-user")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// The name of the repository.
            ///
            /// Example: "Team Environment"
            public var name: String
            /// A short description of the repository.
            public var description: String?
            /// A URL with more information about the repository.
            public var homepage: String?
            /// Whether the repository is private.
            public var isPrivate: Bool?
            /// Whether issues are enabled.
            ///
            /// Example: true
            public var hasIssues: Bool?
            /// Whether projects are enabled.
            ///
            /// Example: true
            public var hasProjects: Bool?
            /// Whether the wiki is enabled.
            ///
            /// Example: true
            public var hasWiki: Bool?
            /// The id of the team that will be granted access to this repository. This is only valid when creating a repository in an organization.
            public var teamID: Int?
            /// Whether the repository is initialized with a minimal README.
            public var isAutoInit: Bool?
            /// The desired language or platform to apply to the .gitignore.
            ///
            /// Example: "Haskell"
            public var gitignoreTemplate: String?
            /// The license keyword of the open source license for this repository.
            ///
            /// Example: "mit"
            public var licenseTemplate: String?
            /// Whether to allow squash merges for pull requests.
            ///
            /// Example: true
            public var allowSquashMerge: Bool?
            /// Whether to allow merge commits for pull requests.
            ///
            /// Example: true
            public var allowMergeCommit: Bool?
            /// Whether to allow rebase merges for pull requests.
            ///
            /// Example: true
            public var allowRebaseMerge: Bool?
            /// Whether to allow Auto-merge to be used on pull requests.
            ///
            /// Example: false
            public var allowAutoMerge: Bool?
            /// Whether to delete head branches when pull requests are merged
            ///
            /// Example: false
            public var deleteBranchOnMerge: Bool?
            /// Whether downloads are enabled.
            ///
            /// Example: true
            public var hasDownloads: Bool?
            /// Whether this repository acts as a template that can be used to generate new repositories.
            ///
            /// Example: true
            public var isTemplate: Bool?

            public init(name: String, description: String? = nil, homepage: String? = nil, isPrivate: Bool? = false, hasIssues: Bool? = true, hasProjects: Bool? = true, hasWiki: Bool? = true, teamID: Int? = nil, isAutoInit: Bool? = false, gitignoreTemplate: String? = nil, licenseTemplate: String? = nil, allowSquashMerge: Bool? = true, allowMergeCommit: Bool? = true, allowRebaseMerge: Bool? = true, allowAutoMerge: Bool? = false, deleteBranchOnMerge: Bool? = false, hasDownloads: Bool? = true, isTemplate: Bool? = false) {
                self.name = name
                self.description = description
                self.homepage = homepage
                self.isPrivate = isPrivate
                self.hasIssues = hasIssues
                self.hasProjects = hasProjects
                self.hasWiki = hasWiki
                self.teamID = teamID
                self.isAutoInit = isAutoInit
                self.gitignoreTemplate = gitignoreTemplate
                self.licenseTemplate = licenseTemplate
                self.allowSquashMerge = allowSquashMerge
                self.allowMergeCommit = allowMergeCommit
                self.allowRebaseMerge = allowRebaseMerge
                self.allowAutoMerge = allowAutoMerge
                self.deleteBranchOnMerge = deleteBranchOnMerge
                self.hasDownloads = hasDownloads
                self.isTemplate = isTemplate
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(name, forKey: "name")
                try values.encodeIfPresent(description, forKey: "description")
                try values.encodeIfPresent(homepage, forKey: "homepage")
                try values.encodeIfPresent(isPrivate, forKey: "private")
                try values.encodeIfPresent(hasIssues, forKey: "has_issues")
                try values.encodeIfPresent(hasProjects, forKey: "has_projects")
                try values.encodeIfPresent(hasWiki, forKey: "has_wiki")
                try values.encodeIfPresent(teamID, forKey: "team_id")
                try values.encodeIfPresent(isAutoInit, forKey: "auto_init")
                try values.encodeIfPresent(gitignoreTemplate, forKey: "gitignore_template")
                try values.encodeIfPresent(licenseTemplate, forKey: "license_template")
                try values.encodeIfPresent(allowSquashMerge, forKey: "allow_squash_merge")
                try values.encodeIfPresent(allowMergeCommit, forKey: "allow_merge_commit")
                try values.encodeIfPresent(allowRebaseMerge, forKey: "allow_rebase_merge")
                try values.encodeIfPresent(allowAutoMerge, forKey: "allow_auto_merge")
                try values.encodeIfPresent(deleteBranchOnMerge, forKey: "delete_branch_on_merge")
                try values.encodeIfPresent(hasDownloads, forKey: "has_downloads")
                try values.encodeIfPresent(isTemplate, forKey: "is_template")
            }
        }
    }
}
