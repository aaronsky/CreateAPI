// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct PullRequestSimple: Codable {
    /// Example: "https://api.github.com/repos/octocat/Hello-World/pulls/1347"
    public var url: URL
    public var id: Int
    /// Example: "MDExOlB1bGxSZXF1ZXN0MQ=="
    public var nodeID: String
    /// Example: "https://github.com/octocat/Hello-World/pull/1347"
    public var htmlURL: URL
    /// Example: "https://github.com/octocat/Hello-World/pull/1347.diff"
    public var diffURL: URL
    /// Example: "https://github.com/octocat/Hello-World/pull/1347.patch"
    public var patchURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/issues/1347"
    public var issueURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/pulls/1347/commits"
    public var commitsURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/pulls/1347/comments"
    public var reviewCommentsURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/pulls/comments{/number}"
    public var reviewCommentURL: String
    /// Example: "https://api.github.com/repos/octocat/Hello-World/issues/1347/comments"
    public var commentsURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/statuses/6dcb09b5b57875f334f61aebed695e2e4193db5e"
    public var statusesURL: URL
    /// Example: 1347
    public var number: Int
    /// Example: "open"
    public var state: String
    /// Example: true
    public var isLocked: Bool
    /// Example: "new-feature"
    public var title: String
    /// Simple User
    public var user: SimpleUser?
    /// Example: "Please pull these awesome changes"
    public var body: String?
    public var labels: [Label]
    /// A collection of related issues and pull requests.
    public var milestone: Milestone?
    /// Example: "too heated"
    public var activeLockReason: String?
    /// Example: "2011-01-26T19:01:12Z"
    public var createdAt: Date
    /// Example: "2011-01-26T19:01:12Z"
    public var updatedAt: Date
    /// Example: "2011-01-26T19:01:12Z"
    public var closedAt: Date?
    /// Example: "2011-01-26T19:01:12Z"
    public var mergedAt: Date?
    /// Example: "e5bd3914e2e596debea16f433f57875b5b90bcd6"
    public var mergeCommitSha: String?
    /// Simple User
    public var assignee: SimpleUser?
    public var assignees: [SimpleUser]?
    public var requestedReviewers: [SimpleUser]?
    public var requestedTeams: [Team]?
    public var head: Head
    public var base: Base
    public var links: Links
    /// Author_association
    ///
    /// How the author is associated with the repository.
    ///
    /// Example: "OWNER"
    public var authorAssociation: AuthorAssociation
    /// The status of auto merging a pull request.
    public var autoMerge: AutoMerge?
    /// Indicates whether or not the pull request is a draft.
    ///
    /// Example: false
    public var isDraft: Bool?

    public struct Label: Codable {
        public var id: Int64
        public var nodeID: String
        public var url: String
        public var name: String
        public var description: String
        public var color: String
        public var isDefault: Bool

        public init(id: Int64, nodeID: String, url: String, name: String, description: String, color: String, isDefault: Bool) {
            self.id = id
            self.nodeID = nodeID
            self.url = url
            self.name = name
            self.description = description
            self.color = color
            self.isDefault = isDefault
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.id = try values.decode(Int64.self, forKey: "id")
            self.nodeID = try values.decode(String.self, forKey: "node_id")
            self.url = try values.decode(String.self, forKey: "url")
            self.name = try values.decode(String.self, forKey: "name")
            self.description = try values.decode(String.self, forKey: "description")
            self.color = try values.decode(String.self, forKey: "color")
            self.isDefault = try values.decode(Bool.self, forKey: "default")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(id, forKey: "id")
            try values.encode(nodeID, forKey: "node_id")
            try values.encode(url, forKey: "url")
            try values.encode(name, forKey: "name")
            try values.encode(description, forKey: "description")
            try values.encode(color, forKey: "color")
            try values.encode(isDefault, forKey: "default")
        }
    }

    public struct Head: Codable {
        public var label: String
        public var ref: String
        /// Repository
        ///
        /// A git repository
        public var repo: Repository
        public var sha: String
        /// Simple User
        public var user: SimpleUser?

        public init(label: String, ref: String, repo: Repository, sha: String, user: SimpleUser? = nil) {
            self.label = label
            self.ref = ref
            self.repo = repo
            self.sha = sha
            self.user = user
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.label = try values.decode(String.self, forKey: "label")
            self.ref = try values.decode(String.self, forKey: "ref")
            self.repo = try values.decode(Repository.self, forKey: "repo")
            self.sha = try values.decode(String.self, forKey: "sha")
            self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(label, forKey: "label")
            try values.encode(ref, forKey: "ref")
            try values.encode(repo, forKey: "repo")
            try values.encode(sha, forKey: "sha")
            try values.encodeIfPresent(user, forKey: "user")
        }
    }

    public struct Base: Codable {
        public var label: String
        public var ref: String
        /// Repository
        ///
        /// A git repository
        public var repo: Repository
        public var sha: String
        /// Simple User
        public var user: SimpleUser?

        public init(label: String, ref: String, repo: Repository, sha: String, user: SimpleUser? = nil) {
            self.label = label
            self.ref = ref
            self.repo = repo
            self.sha = sha
            self.user = user
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.label = try values.decode(String.self, forKey: "label")
            self.ref = try values.decode(String.self, forKey: "ref")
            self.repo = try values.decode(Repository.self, forKey: "repo")
            self.sha = try values.decode(String.self, forKey: "sha")
            self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(label, forKey: "label")
            try values.encode(ref, forKey: "ref")
            try values.encode(repo, forKey: "repo")
            try values.encode(sha, forKey: "sha")
            try values.encodeIfPresent(user, forKey: "user")
        }
    }

    public struct Links: Codable {
        /// Link
        ///
        /// Hypermedia Link
        public var comments: Link
        /// Link
        ///
        /// Hypermedia Link
        public var commits: Link
        /// Link
        ///
        /// Hypermedia Link
        public var statuses: Link
        /// Link
        ///
        /// Hypermedia Link
        public var html: Link
        /// Link
        ///
        /// Hypermedia Link
        public var issue: Link
        /// Link
        ///
        /// Hypermedia Link
        public var reviewComments: Link
        /// Link
        ///
        /// Hypermedia Link
        public var reviewComment: Link
        /// Link
        ///
        /// Hypermedia Link
        public var this: Link

        public init(comments: Link, commits: Link, statuses: Link, html: Link, issue: Link, reviewComments: Link, reviewComment: Link, this: Link) {
            self.comments = comments
            self.commits = commits
            self.statuses = statuses
            self.html = html
            self.issue = issue
            self.reviewComments = reviewComments
            self.reviewComment = reviewComment
            self.this = this
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.comments = try values.decode(Link.self, forKey: "comments")
            self.commits = try values.decode(Link.self, forKey: "commits")
            self.statuses = try values.decode(Link.self, forKey: "statuses")
            self.html = try values.decode(Link.self, forKey: "html")
            self.issue = try values.decode(Link.self, forKey: "issue")
            self.reviewComments = try values.decode(Link.self, forKey: "review_comments")
            self.reviewComment = try values.decode(Link.self, forKey: "review_comment")
            self.this = try values.decode(Link.self, forKey: "self")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(comments, forKey: "comments")
            try values.encode(commits, forKey: "commits")
            try values.encode(statuses, forKey: "statuses")
            try values.encode(html, forKey: "html")
            try values.encode(issue, forKey: "issue")
            try values.encode(reviewComments, forKey: "review_comments")
            try values.encode(reviewComment, forKey: "review_comment")
            try values.encode(this, forKey: "self")
        }
    }

    public init(url: URL, id: Int, nodeID: String, htmlURL: URL, diffURL: URL, patchURL: URL, issueURL: URL, commitsURL: URL, reviewCommentsURL: URL, reviewCommentURL: String, commentsURL: URL, statusesURL: URL, number: Int, state: String, isLocked: Bool, title: String, user: SimpleUser? = nil, body: String? = nil, labels: [Label], milestone: Milestone? = nil, activeLockReason: String? = nil, createdAt: Date, updatedAt: Date, closedAt: Date? = nil, mergedAt: Date? = nil, mergeCommitSha: String? = nil, assignee: SimpleUser? = nil, assignees: [SimpleUser]? = nil, requestedReviewers: [SimpleUser]? = nil, requestedTeams: [Team]? = nil, head: Head, base: Base, links: Links, authorAssociation: AuthorAssociation, autoMerge: AutoMerge? = nil, isDraft: Bool? = nil) {
        self.url = url
        self.id = id
        self.nodeID = nodeID
        self.htmlURL = htmlURL
        self.diffURL = diffURL
        self.patchURL = patchURL
        self.issueURL = issueURL
        self.commitsURL = commitsURL
        self.reviewCommentsURL = reviewCommentsURL
        self.reviewCommentURL = reviewCommentURL
        self.commentsURL = commentsURL
        self.statusesURL = statusesURL
        self.number = number
        self.state = state
        self.isLocked = isLocked
        self.title = title
        self.user = user
        self.body = body
        self.labels = labels
        self.milestone = milestone
        self.activeLockReason = activeLockReason
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.closedAt = closedAt
        self.mergedAt = mergedAt
        self.mergeCommitSha = mergeCommitSha
        self.assignee = assignee
        self.assignees = assignees
        self.requestedReviewers = requestedReviewers
        self.requestedTeams = requestedTeams
        self.head = head
        self.base = base
        self.links = links
        self.authorAssociation = authorAssociation
        self.autoMerge = autoMerge
        self.isDraft = isDraft
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        self.diffURL = try values.decode(URL.self, forKey: "diff_url")
        self.patchURL = try values.decode(URL.self, forKey: "patch_url")
        self.issueURL = try values.decode(URL.self, forKey: "issue_url")
        self.commitsURL = try values.decode(URL.self, forKey: "commits_url")
        self.reviewCommentsURL = try values.decode(URL.self, forKey: "review_comments_url")
        self.reviewCommentURL = try values.decode(String.self, forKey: "review_comment_url")
        self.commentsURL = try values.decode(URL.self, forKey: "comments_url")
        self.statusesURL = try values.decode(URL.self, forKey: "statuses_url")
        self.number = try values.decode(Int.self, forKey: "number")
        self.state = try values.decode(String.self, forKey: "state")
        self.isLocked = try values.decode(Bool.self, forKey: "locked")
        self.title = try values.decode(String.self, forKey: "title")
        self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
        self.body = try values.decodeIfPresent(String.self, forKey: "body")
        self.labels = try values.decode([Label].self, forKey: "labels")
        self.milestone = try values.decodeIfPresent(Milestone.self, forKey: "milestone")
        self.activeLockReason = try values.decodeIfPresent(String.self, forKey: "active_lock_reason")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.closedAt = try values.decodeIfPresent(Date.self, forKey: "closed_at")
        self.mergedAt = try values.decodeIfPresent(Date.self, forKey: "merged_at")
        self.mergeCommitSha = try values.decodeIfPresent(String.self, forKey: "merge_commit_sha")
        self.assignee = try values.decodeIfPresent(SimpleUser.self, forKey: "assignee")
        self.assignees = try values.decodeIfPresent([SimpleUser].self, forKey: "assignees")
        self.requestedReviewers = try values.decodeIfPresent([SimpleUser].self, forKey: "requested_reviewers")
        self.requestedTeams = try values.decodeIfPresent([Team].self, forKey: "requested_teams")
        self.head = try values.decode(Head.self, forKey: "head")
        self.base = try values.decode(Base.self, forKey: "base")
        self.links = try values.decode(Links.self, forKey: "_links")
        self.authorAssociation = try values.decode(AuthorAssociation.self, forKey: "author_association")
        self.autoMerge = try values.decodeIfPresent(AutoMerge.self, forKey: "auto_merge")
        self.isDraft = try values.decodeIfPresent(Bool.self, forKey: "draft")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(diffURL, forKey: "diff_url")
        try values.encode(patchURL, forKey: "patch_url")
        try values.encode(issueURL, forKey: "issue_url")
        try values.encode(commitsURL, forKey: "commits_url")
        try values.encode(reviewCommentsURL, forKey: "review_comments_url")
        try values.encode(reviewCommentURL, forKey: "review_comment_url")
        try values.encode(commentsURL, forKey: "comments_url")
        try values.encode(statusesURL, forKey: "statuses_url")
        try values.encode(number, forKey: "number")
        try values.encode(state, forKey: "state")
        try values.encode(isLocked, forKey: "locked")
        try values.encode(title, forKey: "title")
        try values.encodeIfPresent(user, forKey: "user")
        try values.encodeIfPresent(body, forKey: "body")
        try values.encode(labels, forKey: "labels")
        try values.encodeIfPresent(milestone, forKey: "milestone")
        try values.encodeIfPresent(activeLockReason, forKey: "active_lock_reason")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encodeIfPresent(closedAt, forKey: "closed_at")
        try values.encodeIfPresent(mergedAt, forKey: "merged_at")
        try values.encodeIfPresent(mergeCommitSha, forKey: "merge_commit_sha")
        try values.encodeIfPresent(assignee, forKey: "assignee")
        try values.encodeIfPresent(assignees, forKey: "assignees")
        try values.encodeIfPresent(requestedReviewers, forKey: "requested_reviewers")
        try values.encodeIfPresent(requestedTeams, forKey: "requested_teams")
        try values.encode(head, forKey: "head")
        try values.encode(base, forKey: "base")
        try values.encode(links, forKey: "_links")
        try values.encode(authorAssociation, forKey: "author_association")
        try values.encodeIfPresent(autoMerge, forKey: "auto_merge")
        try values.encodeIfPresent(isDraft, forKey: "draft")
    }
}
