// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct IssueSearchResultItem: Codable {
    public var url: URL
    public var repositoryURL: URL
    public var labelsURL: String
    public var commentsURL: URL
    public var eventsURL: URL
    public var htmlURL: URL
    public var id: Int
    public var nodeID: String
    public var number: Int
    public var title: String
    public var isLocked: Bool
    public var activeLockReason: String?
    public var assignees: [SimpleUser]?
    /// Simple User
    public var user: SimpleUser?
    public var labels: [Label]
    public var state: String
    /// Simple User
    public var assignee: SimpleUser?
    /// A collection of related issues and pull requests.
    public var milestone: Milestone?
    public var comments: Int
    public var createdAt: Date
    public var updatedAt: Date
    public var closedAt: Date?
    /// Search Result Text Matches
    public var textMatches: [SearchResultTextMatch]?
    public var pullRequest: PullRequest?
    public var body: String?
    public var score: Double
    /// Author_association
    ///
    /// How the author is associated with the repository.
    ///
    /// Example: "OWNER"
    public var authorAssociation: AuthorAssociation
    public var isDraft: Bool?
    /// A git repository
    public var repository: Repository?
    public var bodyHTML: String?
    public var bodyText: String?
    public var timelineURL: URL?
    /// GitHub app
    ///
    /// GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    public var performedViaGithubApp: Integration?
    /// Reaction Rollup
    public var reactions: ReactionRollup?

    public struct Label: Codable {
        public var id: Int64?
        public var nodeID: String?
        public var url: String?
        public var name: String?
        public var color: String?
        public var isDefault: Bool?
        public var description: String?

        public init(id: Int64? = nil, nodeID: String? = nil, url: String? = nil, name: String? = nil, color: String? = nil, isDefault: Bool? = nil, description: String? = nil) {
            self.id = id
            self.nodeID = nodeID
            self.url = url
            self.name = name
            self.color = color
            self.isDefault = isDefault
            self.description = description
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.id = try values.decodeIfPresent(Int64.self, forKey: "id")
            self.nodeID = try values.decodeIfPresent(String.self, forKey: "node_id")
            self.url = try values.decodeIfPresent(String.self, forKey: "url")
            self.name = try values.decodeIfPresent(String.self, forKey: "name")
            self.color = try values.decodeIfPresent(String.self, forKey: "color")
            self.isDefault = try values.decodeIfPresent(Bool.self, forKey: "default")
            self.description = try values.decodeIfPresent(String.self, forKey: "description")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(id, forKey: "id")
            try values.encodeIfPresent(nodeID, forKey: "node_id")
            try values.encodeIfPresent(url, forKey: "url")
            try values.encodeIfPresent(name, forKey: "name")
            try values.encodeIfPresent(color, forKey: "color")
            try values.encodeIfPresent(isDefault, forKey: "default")
            try values.encodeIfPresent(description, forKey: "description")
        }
    }

    public struct PullRequest: Codable {
        public var mergedAt: Date?
        public var diffURL: URL?
        public var htmlURL: URL?
        public var patchURL: URL?
        public var url: URL?

        public init(mergedAt: Date? = nil, diffURL: URL? = nil, htmlURL: URL? = nil, patchURL: URL? = nil, url: URL? = nil) {
            self.mergedAt = mergedAt
            self.diffURL = diffURL
            self.htmlURL = htmlURL
            self.patchURL = patchURL
            self.url = url
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.mergedAt = try values.decodeIfPresent(Date.self, forKey: "merged_at")
            self.diffURL = try values.decodeIfPresent(URL.self, forKey: "diff_url")
            self.htmlURL = try values.decodeIfPresent(URL.self, forKey: "html_url")
            self.patchURL = try values.decodeIfPresent(URL.self, forKey: "patch_url")
            self.url = try values.decodeIfPresent(URL.self, forKey: "url")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(mergedAt, forKey: "merged_at")
            try values.encodeIfPresent(diffURL, forKey: "diff_url")
            try values.encodeIfPresent(htmlURL, forKey: "html_url")
            try values.encodeIfPresent(patchURL, forKey: "patch_url")
            try values.encodeIfPresent(url, forKey: "url")
        }
    }

    public init(url: URL, repositoryURL: URL, labelsURL: String, commentsURL: URL, eventsURL: URL, htmlURL: URL, id: Int, nodeID: String, number: Int, title: String, isLocked: Bool, activeLockReason: String? = nil, assignees: [SimpleUser]? = nil, user: SimpleUser? = nil, labels: [Label], state: String, assignee: SimpleUser? = nil, milestone: Milestone? = nil, comments: Int, createdAt: Date, updatedAt: Date, closedAt: Date? = nil, textMatches: [SearchResultTextMatch]? = nil, pullRequest: PullRequest? = nil, body: String? = nil, score: Double, authorAssociation: AuthorAssociation, isDraft: Bool? = nil, repository: Repository? = nil, bodyHTML: String? = nil, bodyText: String? = nil, timelineURL: URL? = nil, performedViaGithubApp: Integration? = nil, reactions: ReactionRollup? = nil) {
        self.url = url
        self.repositoryURL = repositoryURL
        self.labelsURL = labelsURL
        self.commentsURL = commentsURL
        self.eventsURL = eventsURL
        self.htmlURL = htmlURL
        self.id = id
        self.nodeID = nodeID
        self.number = number
        self.title = title
        self.isLocked = isLocked
        self.activeLockReason = activeLockReason
        self.assignees = assignees
        self.user = user
        self.labels = labels
        self.state = state
        self.assignee = assignee
        self.milestone = milestone
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.closedAt = closedAt
        self.textMatches = textMatches
        self.pullRequest = pullRequest
        self.body = body
        self.score = score
        self.authorAssociation = authorAssociation
        self.isDraft = isDraft
        self.repository = repository
        self.bodyHTML = bodyHTML
        self.bodyText = bodyText
        self.timelineURL = timelineURL
        self.performedViaGithubApp = performedViaGithubApp
        self.reactions = reactions
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.repositoryURL = try values.decode(URL.self, forKey: "repository_url")
        self.labelsURL = try values.decode(String.self, forKey: "labels_url")
        self.commentsURL = try values.decode(URL.self, forKey: "comments_url")
        self.eventsURL = try values.decode(URL.self, forKey: "events_url")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.number = try values.decode(Int.self, forKey: "number")
        self.title = try values.decode(String.self, forKey: "title")
        self.isLocked = try values.decode(Bool.self, forKey: "locked")
        self.activeLockReason = try values.decodeIfPresent(String.self, forKey: "active_lock_reason")
        self.assignees = try values.decodeIfPresent([SimpleUser].self, forKey: "assignees")
        self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
        self.labels = try values.decode([Label].self, forKey: "labels")
        self.state = try values.decode(String.self, forKey: "state")
        self.assignee = try values.decodeIfPresent(SimpleUser.self, forKey: "assignee")
        self.milestone = try values.decodeIfPresent(Milestone.self, forKey: "milestone")
        self.comments = try values.decode(Int.self, forKey: "comments")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.closedAt = try values.decodeIfPresent(Date.self, forKey: "closed_at")
        self.textMatches = try values.decodeIfPresent([SearchResultTextMatch].self, forKey: "text_matches")
        self.pullRequest = try values.decodeIfPresent(PullRequest.self, forKey: "pull_request")
        self.body = try values.decodeIfPresent(String.self, forKey: "body")
        self.score = try values.decode(Double.self, forKey: "score")
        self.authorAssociation = try values.decode(AuthorAssociation.self, forKey: "author_association")
        self.isDraft = try values.decodeIfPresent(Bool.self, forKey: "draft")
        self.repository = try values.decodeIfPresent(Repository.self, forKey: "repository")
        self.bodyHTML = try values.decodeIfPresent(String.self, forKey: "body_html")
        self.bodyText = try values.decodeIfPresent(String.self, forKey: "body_text")
        self.timelineURL = try values.decodeIfPresent(URL.self, forKey: "timeline_url")
        self.performedViaGithubApp = try values.decodeIfPresent(Integration.self, forKey: "performed_via_github_app")
        self.reactions = try values.decodeIfPresent(ReactionRollup.self, forKey: "reactions")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(repositoryURL, forKey: "repository_url")
        try values.encode(labelsURL, forKey: "labels_url")
        try values.encode(commentsURL, forKey: "comments_url")
        try values.encode(eventsURL, forKey: "events_url")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(number, forKey: "number")
        try values.encode(title, forKey: "title")
        try values.encode(isLocked, forKey: "locked")
        try values.encodeIfPresent(activeLockReason, forKey: "active_lock_reason")
        try values.encodeIfPresent(assignees, forKey: "assignees")
        try values.encodeIfPresent(user, forKey: "user")
        try values.encode(labels, forKey: "labels")
        try values.encode(state, forKey: "state")
        try values.encodeIfPresent(assignee, forKey: "assignee")
        try values.encodeIfPresent(milestone, forKey: "milestone")
        try values.encode(comments, forKey: "comments")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encodeIfPresent(closedAt, forKey: "closed_at")
        try values.encodeIfPresent(textMatches, forKey: "text_matches")
        try values.encodeIfPresent(pullRequest, forKey: "pull_request")
        try values.encodeIfPresent(body, forKey: "body")
        try values.encode(score, forKey: "score")
        try values.encode(authorAssociation, forKey: "author_association")
        try values.encodeIfPresent(isDraft, forKey: "draft")
        try values.encodeIfPresent(repository, forKey: "repository")
        try values.encodeIfPresent(bodyHTML, forKey: "body_html")
        try values.encodeIfPresent(bodyText, forKey: "body_text")
        try values.encodeIfPresent(timelineURL, forKey: "timeline_url")
        try values.encodeIfPresent(performedViaGithubApp, forKey: "performed_via_github_app")
        try values.encodeIfPresent(reactions, forKey: "reactions")
    }
}
