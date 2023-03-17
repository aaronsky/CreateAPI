// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.CheckRuns {
    public func checkRunID(_ checkRunID: Int) -> WithCheckRunID {
        WithCheckRunID(path: "\(path)/\(checkRunID)")
    }

    public struct WithCheckRunID {
        /// Path: `/repos/{owner}/{repo}/check-runs/{check_run_id}`
        public let path: String

        /// Get a check run
        ///
        /// **Note:** The Checks API only looks for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array.
        /// 
        /// Gets a single check run using its `id`. GitHub Apps must have the `checks:read` permission on a private repository or pull access to a public repository to get check runs. OAuth Apps and authenticated users must have the `repo` scope to get check runs in a private repository.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/checks#get-a-check-run)
        public var get: Request<OctoKit.CheckRun> {
            Request(path: path, method: "GET", id: "checks/get")
        }

        /// Update a check run
        ///
        /// **Note:** The Checks API only looks for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array.
        /// 
        /// Updates a check run for a specific commit in a repository. Your GitHub App must have the `checks:write` permission to edit check runs.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/checks#update-a-check-run)
        public func patch(_ body: PatchRequest) -> Request<OctoKit.CheckRun> {
            Request(path: path, method: "PATCH", body: body, id: "checks/update")
        }

        public struct PatchRequest: Encodable {
            /// The name of the check. For example, "code-coverage".
            public var name: String?
            /// The URL of the integrator's site that has the full details of the check.
            public var detailsURL: String?
            /// A reference for the run on the integrator's system.
            public var externalID: String?
            /// This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
            public var startedAt: Date?
            /// The current status. Can be one of `queued`, `in_progress`, or `completed`.
            public var status: Status?
            /// **Required if you provide `completed_at` or a `status` of `completed`**. The final conclusion of the check. Can be one of `action_required`, `cancelled`, `failure`, `neutral`, `success`, `skipped`, `stale`, or `timed_out`.  
            /// **Note:** Providing `conclusion` will automatically set the `status` parameter to `completed`. You cannot change a check run conclusion to `stale`, only GitHub can set this.
            public var conclusion: Conclusion?
            /// The time the check completed. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
            public var completedAt: Date?
            /// Check runs can accept a variety of data in the `output` object, including a `title` and `summary` and can optionally provide descriptive details about the run. See the [`output` object](https://docs.github.com/rest/reference/checks#output-object-1) description.
            public var output: Output?
            /// Possible further actions the integrator can perform, which a user may trigger. Each action includes a `label`, `identifier` and `description`. A maximum of three actions are accepted. See the [`actions` object](https://docs.github.com/rest/reference/checks#actions-object) description. To learn more about check runs and requested actions, see "[Check runs and requested actions](https://docs.github.com/rest/reference/checks#check-runs-and-requested-actions)."
            public var actions: [Action]?

            /// The current status. Can be one of `queued`, `in_progress`, or `completed`.
            public enum Status: String, CaseIterable, Codable {
                case queued
                case inProgress = "in_progress"
                case completed
            }

            /// **Required if you provide `completed_at` or a `status` of `completed`**. The final conclusion of the check. Can be one of `action_required`, `cancelled`, `failure`, `neutral`, `success`, `skipped`, `stale`, or `timed_out`.  
            /// **Note:** Providing `conclusion` will automatically set the `status` parameter to `completed`. You cannot change a check run conclusion to `stale`, only GitHub can set this.
            public enum Conclusion: String, CaseIterable, Codable {
                case actionRequired = "action_required"
                case cancelled
                case failure
                case neutral
                case success
                case skipped
                case stale
                case timedOut = "timed_out"
            }

            /// Check runs can accept a variety of data in the `output` object, including a `title` and `summary` and can optionally provide descriptive details about the run. See the [`output` object](https://docs.github.com/rest/reference/checks#output-object-1) description.
            public struct Output: Encodable {
                /// **Required**.
                public var title: String?
                /// Can contain Markdown.
                public var summary: String
                /// Can contain Markdown.
                public var text: String?
                /// Adds information from your analysis to specific lines of code. Annotations are visible in GitHub's pull request UI. Annotations are visible in GitHub's pull request UI. The Checks API limits the number of annotations to a maximum of 50 per API request. To create more than 50 annotations, you have to make multiple requests to the [Update a check run](https://docs.github.com/rest/reference/checks#update-a-check-run) endpoint. Each time you update the check run, annotations are appended to the list of annotations that already exist for the check run. For details about annotations in the UI, see "[About status checks](https://help.github.com/articles/about-status-checks#checks)". See the [`annotations` object](https://docs.github.com/rest/reference/checks#annotations-object-1) description for details.
                public var annotations: [Annotation]?
                /// Adds images to the output displayed in the GitHub pull request UI. See the [`images` object](https://docs.github.com/rest/reference/checks#annotations-object-1) description for details.
                public var images: [Image]?

                public struct Annotation: Encodable {
                    /// The path of the file to add an annotation to. For example, `assets/css/main.css`.
                    public var path: String
                    /// The start line of the annotation.
                    public var startLine: Int
                    /// The end line of the annotation.
                    public var endLine: Int
                    /// The start column of the annotation. Annotations only support `start_column` and `end_column` on the same line. Omit this parameter if `start_line` and `end_line` have different values.
                    public var startColumn: Int?
                    /// The end column of the annotation. Annotations only support `start_column` and `end_column` on the same line. Omit this parameter if `start_line` and `end_line` have different values.
                    public var endColumn: Int?
                    /// The level of the annotation. Can be one of `notice`, `warning`, or `failure`.
                    public var annotationLevel: AnnotationLevel
                    /// A short description of the feedback for these lines of code. The maximum size is 64 KB.
                    public var message: String
                    /// The title that represents the annotation. The maximum size is 255 characters.
                    public var title: String?
                    /// Details about this annotation. The maximum size is 64 KB.
                    public var rawDetails: String?

                    /// The level of the annotation. Can be one of `notice`, `warning`, or `failure`.
                    public enum AnnotationLevel: String, CaseIterable, Codable {
                        case notice
                        case warning
                        case failure
                    }

                    public init(path: String, startLine: Int, endLine: Int, startColumn: Int? = nil, endColumn: Int? = nil, annotationLevel: AnnotationLevel, message: String, title: String? = nil, rawDetails: String? = nil) {
                        self.path = path
                        self.startLine = startLine
                        self.endLine = endLine
                        self.startColumn = startColumn
                        self.endColumn = endColumn
                        self.annotationLevel = annotationLevel
                        self.message = message
                        self.title = title
                        self.rawDetails = rawDetails
                    }

                    public func encode(to encoder: Encoder) throws {
                        var values = encoder.container(keyedBy: StringCodingKey.self)
                        try values.encode(path, forKey: "path")
                        try values.encode(startLine, forKey: "start_line")
                        try values.encode(endLine, forKey: "end_line")
                        try values.encodeIfPresent(startColumn, forKey: "start_column")
                        try values.encodeIfPresent(endColumn, forKey: "end_column")
                        try values.encode(annotationLevel, forKey: "annotation_level")
                        try values.encode(message, forKey: "message")
                        try values.encodeIfPresent(title, forKey: "title")
                        try values.encodeIfPresent(rawDetails, forKey: "raw_details")
                    }
                }

                public struct Image: Encodable {
                    /// The alternative text for the image.
                    public var alt: String
                    /// The full URL of the image.
                    public var imageURL: String
                    /// A short image description.
                    public var caption: String?

                    public init(alt: String, imageURL: String, caption: String? = nil) {
                        self.alt = alt
                        self.imageURL = imageURL
                        self.caption = caption
                    }

                    public func encode(to encoder: Encoder) throws {
                        var values = encoder.container(keyedBy: StringCodingKey.self)
                        try values.encode(alt, forKey: "alt")
                        try values.encode(imageURL, forKey: "image_url")
                        try values.encodeIfPresent(caption, forKey: "caption")
                    }
                }

                public init(title: String? = nil, summary: String, text: String? = nil, annotations: [Annotation]? = nil, images: [Image]? = nil) {
                    self.title = title
                    self.summary = summary
                    self.text = text
                    self.annotations = annotations
                    self.images = images
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encodeIfPresent(title, forKey: "title")
                    try values.encode(summary, forKey: "summary")
                    try values.encodeIfPresent(text, forKey: "text")
                    try values.encodeIfPresent(annotations, forKey: "annotations")
                    try values.encodeIfPresent(images, forKey: "images")
                }
            }

            public struct Action: Encodable {
                /// The text to be displayed on a button in the web UI. The maximum size is 20 characters.
                public var label: String
                /// A short explanation of what this action would do. The maximum size is 40 characters.
                public var description: String
                /// A reference for the action on the integrator's system. The maximum size is 20 characters.
                public var identifier: String?
                public var identifie: AnyJSON

                public init(label: String, description: String, identifier: String? = nil, identifie: AnyJSON) {
                    self.label = label
                    self.description = description
                    self.identifier = identifier
                    self.identifie = identifie
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(label, forKey: "label")
                    try values.encode(description, forKey: "description")
                    try values.encodeIfPresent(identifier, forKey: "identifier")
                    try values.encode(identifie, forKey: "identifie")
                }
            }

            public init(name: String? = nil, detailsURL: String? = nil, externalID: String? = nil, startedAt: Date? = nil, status: Status? = nil, conclusion: Conclusion? = nil, completedAt: Date? = nil, output: Output? = nil, actions: [Action]? = nil) {
                self.name = name
                self.detailsURL = detailsURL
                self.externalID = externalID
                self.startedAt = startedAt
                self.status = status
                self.conclusion = conclusion
                self.completedAt = completedAt
                self.output = output
                self.actions = actions
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(name, forKey: "name")
                try values.encodeIfPresent(detailsURL, forKey: "details_url")
                try values.encodeIfPresent(externalID, forKey: "external_id")
                try values.encodeIfPresent(startedAt, forKey: "started_at")
                try values.encodeIfPresent(status, forKey: "status")
                try values.encodeIfPresent(conclusion, forKey: "conclusion")
                try values.encodeIfPresent(completedAt, forKey: "completed_at")
                try values.encodeIfPresent(output, forKey: "output")
                try values.encodeIfPresent(actions, forKey: "actions")
            }
        }
    }
}
