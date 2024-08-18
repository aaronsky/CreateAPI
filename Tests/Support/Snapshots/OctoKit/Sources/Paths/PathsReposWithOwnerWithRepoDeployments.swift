// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var deployments: Deployments {
        Deployments(path: path + "/deployments")
    }

    public struct Deployments {
        /// Path: `/repos/{owner}/{repo}/deployments`
        public let path: String

        /// List deployments
        ///
        /// Simple filtering of deployments is available via query parameters:
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-deployments)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Deployment]> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "repos/list-deployments")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var sha: String?
            public var ref: String?
            public var task: String?
            public var environment: String?
            public var perPage: Int?
            public var page: Int?

            public init(sha: String? = nil, ref: String? = nil, task: String? = nil, environment: String? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.sha = sha
                self.ref = ref
                self.task = task
                self.environment = environment
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(sha, forKey: "sha")
                encoder.encode(ref, forKey: "ref")
                encoder.encode(task, forKey: "task")
                encoder.encode(environment, forKey: "environment")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }

        /// Create a deployment
        ///
        /// Deployments offer a few configurable parameters with certain defaults.
        /// 
        /// The `ref` parameter can be any named branch, tag, or SHA. At GitHub we often deploy branches and verify them
        /// before we merge a pull request.
        /// 
        /// The `environment` parameter allows deployments to be issued to different runtime environments. Teams often have
        /// multiple environments for verifying their applications, such as `production`, `staging`, and `qa`. This parameter
        /// makes it easier to track which environments have requested deployments. The default environment is `production`.
        /// 
        /// The `auto_merge` parameter is used to ensure that the requested ref is not behind the repository's default branch. If
        /// the ref _is_ behind the default branch for the repository, we will attempt to merge it for you. If the merge succeeds,
        /// the API will return a successful merge commit. If merge conflicts prevent the merge from succeeding, the API will
        /// return a failure response.
        /// 
        /// By default, [commit statuses](https://docs.github.com/rest/reference/repos#statuses) for every submitted context must be in a `success`
        /// state. The `required_contexts` parameter allows you to specify a subset of contexts that must be `success`, or to
        /// specify contexts that have not yet been submitted. You are not required to use commit statuses to deploy. If you do
        /// not require any contexts or create any commit statuses, the deployment will always succeed.
        /// 
        /// The `payload` parameter is available for any extra information that a deployment system might need. It is a JSON text
        /// field that will be passed on when a deployment event is dispatched.
        /// 
        /// The `task` parameter is used by the deployment system to allow different execution paths. In the web world this might
        /// be `deploy:migrations` to run schema changes on the system. In the compiled world this could be a flag to compile an
        /// application with debugging enabled.
        /// 
        /// Users with `repo` or `repo_deployment` scopes can create a deployment for a given ref.
        /// 
        /// #### Merged branch response
        /// You will see this response when GitHub automatically merges the base branch into the topic branch instead of creating
        /// a deployment. This auto-merge happens when:
        /// *   Auto-merge option is enabled in the repository
        /// *   Topic branch does not include the latest changes on the base branch, which is `master` in the response example
        /// *   There are no merge conflicts
        /// 
        /// If there are no new commits in the base branch, a new request to create a deployment should give a successful
        /// response.
        /// 
        /// #### Merge conflict response
        /// This error happens when the `auto_merge` option is enabled and when the default branch (in this case `master`), can't
        /// be merged into the branch that's being deployed (in this case `topic-branch`), due to merge conflicts.
        /// 
        /// #### Failed commit status checks
        /// This error happens when the `required_contexts` parameter indicates that one or more contexts need to have a `success`
        /// status for the commit to be deployed, but one or more of the required contexts do not have a state of `success`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#create-a-deployment)
        public func post(_ body: PostRequest) -> Request<OctoKit.Deployment> {
            Request(path: path, method: "POST", body: body, id: "repos/create-deployment")
        }

        public struct PostRequest: Encodable {
            /// The ref to deploy. This can be a branch, tag, or SHA.
            public var ref: String
            /// Specifies a task to execute (e.g., `deploy` or `deploy:migrations`).
            public var task: String?
            /// Attempts to automatically merge the default branch into the requested ref, if it's behind the default branch.
            public var isAutoMerge: Bool?
            /// The [status](https://docs.github.com/rest/reference/repos#statuses) contexts to verify against commit status checks. If you omit this parameter, GitHub verifies all unique contexts before creating a deployment. To bypass checking entirely, pass an empty array. Defaults to all unique contexts.
            public var requiredContexts: [String]?
            public var payload: Payload?
            /// Name for the target deployment environment (e.g., `production`, `staging`, `qa`).
            public var environment: String?
            /// Short description of the deployment.
            public var description: String?
            /// Specifies if the given environment is specific to the deployment and will no longer exist at some point in the future. Default: `false`
            public var isTransientEnvironment: Bool?
            /// Specifies if the given environment is one that end-users directly interact with. Default: `true` when `environment` is `production` and `false` otherwise.
            public var isProductionEnvironment: Bool?

            public enum Payload: Encodable {
                case object([String: AnyJSON])
                case string(String)

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .object(let value): try container.encode(value)
                    case .string(let value): try container.encode(value)
                    }
                }
            }

            public init(ref: String, task: String? = "deploy", isAutoMerge: Bool? = true, requiredContexts: [String]? = nil, payload: Payload? = nil, environment: String? = "production", description: String? = "", isTransientEnvironment: Bool? = false, isProductionEnvironment: Bool? = nil) {
                self.ref = ref
                self.task = task
                self.isAutoMerge = isAutoMerge
                self.requiredContexts = requiredContexts
                self.payload = payload
                self.environment = environment
                self.description = description
                self.isTransientEnvironment = isTransientEnvironment
                self.isProductionEnvironment = isProductionEnvironment
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(ref, forKey: "ref")
                try values.encodeIfPresent(task, forKey: "task")
                try values.encodeIfPresent(isAutoMerge, forKey: "auto_merge")
                try values.encodeIfPresent(requiredContexts, forKey: "required_contexts")
                try values.encodeIfPresent(payload, forKey: "payload")
                try values.encodeIfPresent(environment, forKey: "environment")
                try values.encodeIfPresent(description, forKey: "description")
                try values.encodeIfPresent(isTransientEnvironment, forKey: "transient_environment")
                try values.encodeIfPresent(isProductionEnvironment, forKey: "production_environment")
            }
        }
    }
}
