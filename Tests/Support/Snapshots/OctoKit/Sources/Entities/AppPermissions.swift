// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// The permissions granted to the user-to-server access token.
///
/// Example:
///
/// {
///   "contents" : "read",
///   "deployments" : "write",
///   "issues" : "read",
///   "single_file" : "read"
/// }
public struct AppPermissions: Codable {
    /// The level of permission to grant the access token for GitHub Actions workflows, workflow runs, and artifacts. Can be one of: `read` or `write`.
    public var actions: Actions?
    /// The level of permission to grant the access token for repository creation, deletion, settings, teams, and collaborators creation. Can be one of: `read` or `write`.
    public var administration: Administration?
    /// The level of permission to grant the access token for checks on code. Can be one of: `read` or `write`.
    public var checks: Checks?
    /// The level of permission to grant the access token for repository contents, commits, branches, downloads, releases, and merges. Can be one of: `read` or `write`.
    public var contents: Contents?
    /// The level of permission to grant the access token for deployments and deployment statuses. Can be one of: `read` or `write`.
    public var deployments: Deployments?
    /// The level of permission to grant the access token for managing repository environments. Can be one of: `read` or `write`.
    public var environments: Environments?
    /// The level of permission to grant the access token for issues and related comments, assignees, labels, and milestones. Can be one of: `read` or `write`.
    public var issues: Issues?
    /// The level of permission to grant the access token to search repositories, list collaborators, and access repository metadata. Can be one of: `read` or `write`.
    public var metadata: Metadata?
    /// The level of permission to grant the access token for packages published to GitHub Packages. Can be one of: `read` or `write`.
    public var packages: Packages?
    /// The level of permission to grant the access token to retrieve Pages statuses, configuration, and builds, as well as create new builds. Can be one of: `read` or `write`.
    public var pages: Pages?
    /// The level of permission to grant the access token for pull requests and related comments, assignees, labels, milestones, and merges. Can be one of: `read` or `write`.
    public var pullRequests: PullRequests?
    /// The level of permission to grant the access token to manage the post-receive hooks for a repository. Can be one of: `read` or `write`.
    public var repositoryHooks: RepositoryHooks?
    /// The level of permission to grant the access token to manage repository projects, columns, and cards. Can be one of: `read`, `write`, or `admin`.
    public var repositoryProjects: RepositoryProjects?
    /// The level of permission to grant the access token to view and manage secret scanning alerts. Can be one of: `read` or `write`.
    public var secretScanningAlerts: SecretScanningAlerts?
    /// The level of permission to grant the access token to manage repository secrets. Can be one of: `read` or `write`.
    public var secrets: Secrets?
    /// The level of permission to grant the access token to view and manage security events like code scanning alerts. Can be one of: `read` or `write`.
    public var securityEvents: SecurityEvents?
    /// The level of permission to grant the access token to manage just a single file. Can be one of: `read` or `write`.
    public var singleFile: SingleFile?
    /// The level of permission to grant the access token for commit statuses. Can be one of: `read` or `write`.
    public var statuses: Statuses?
    /// The level of permission to grant the access token to manage Dependabot alerts. Can be one of: `read` or `write`.
    public var vulnerabilityAlerts: VulnerabilityAlerts?
    /// The level of permission to grant the access token to update GitHub Actions workflow files. Can be one of: `write`.
    public var workflows: Workflows?
    /// The level of permission to grant the access token for organization teams and members. Can be one of: `read` or `write`.
    public var members: Members?
    /// The level of permission to grant the access token to manage access to an organization. Can be one of: `read` or `write`.
    public var organizationAdministration: OrganizationAdministration?
    /// The level of permission to grant the access token to manage the post-receive hooks for an organization. Can be one of: `read` or `write`.
    public var organizationHooks: OrganizationHooks?
    /// The level of permission to grant the access token for viewing an organization's plan. Can be one of: `read`.
    public var organizationPlan: OrganizationPlan?
    /// The level of permission to grant the access token to manage organization projects and projects beta (where available). Can be one of: `read`, `write`, or `admin`.
    public var organizationProjects: OrganizationProjects?
    /// The level of permission to grant the access token for organization packages published to GitHub Packages. Can be one of: `read` or `write`.
    public var organizationPackages: OrganizationPackages?
    /// The level of permission to grant the access token to manage organization secrets. Can be one of: `read` or `write`.
    public var organizationSecrets: OrganizationSecrets?
    /// The level of permission to grant the access token to view and manage GitHub Actions self-hosted runners available to an organization. Can be one of: `read` or `write`.
    public var organizationSelfHostedRunners: OrganizationSelfHostedRunners?
    /// The level of permission to grant the access token to view and manage users blocked by the organization. Can be one of: `read` or `write`.
    public var organizationUserBlocking: OrganizationUserBlocking?
    /// The level of permission to grant the access token to manage team discussions and related comments. Can be one of: `read` or `write`.
    public var teamDiscussions: TeamDiscussions?

    /// The level of permission to grant the access token for GitHub Actions workflows, workflow runs, and artifacts. Can be one of: `read` or `write`.
    public enum Actions: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for repository creation, deletion, settings, teams, and collaborators creation. Can be one of: `read` or `write`.
    public enum Administration: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for checks on code. Can be one of: `read` or `write`.
    public enum Checks: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for repository contents, commits, branches, downloads, releases, and merges. Can be one of: `read` or `write`.
    public enum Contents: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for deployments and deployment statuses. Can be one of: `read` or `write`.
    public enum Deployments: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for managing repository environments. Can be one of: `read` or `write`.
    public enum Environments: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for issues and related comments, assignees, labels, and milestones. Can be one of: `read` or `write`.
    public enum Issues: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to search repositories, list collaborators, and access repository metadata. Can be one of: `read` or `write`.
    public enum Metadata: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for packages published to GitHub Packages. Can be one of: `read` or `write`.
    public enum Packages: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to retrieve Pages statuses, configuration, and builds, as well as create new builds. Can be one of: `read` or `write`.
    public enum Pages: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for pull requests and related comments, assignees, labels, milestones, and merges. Can be one of: `read` or `write`.
    public enum PullRequests: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage the post-receive hooks for a repository. Can be one of: `read` or `write`.
    public enum RepositoryHooks: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage repository projects, columns, and cards. Can be one of: `read`, `write`, or `admin`.
    public enum RepositoryProjects: String, Codable, CaseIterable {
        case read
        case write
        case admin
    }

    /// The level of permission to grant the access token to view and manage secret scanning alerts. Can be one of: `read` or `write`.
    public enum SecretScanningAlerts: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage repository secrets. Can be one of: `read` or `write`.
    public enum Secrets: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to view and manage security events like code scanning alerts. Can be one of: `read` or `write`.
    public enum SecurityEvents: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage just a single file. Can be one of: `read` or `write`.
    public enum SingleFile: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for commit statuses. Can be one of: `read` or `write`.
    public enum Statuses: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage Dependabot alerts. Can be one of: `read` or `write`.
    public enum VulnerabilityAlerts: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to update GitHub Actions workflow files. Can be one of: `write`.
    public enum Workflows: String, Codable, CaseIterable {
        case write
    }

    /// The level of permission to grant the access token for organization teams and members. Can be one of: `read` or `write`.
    public enum Members: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage access to an organization. Can be one of: `read` or `write`.
    public enum OrganizationAdministration: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage the post-receive hooks for an organization. Can be one of: `read` or `write`.
    public enum OrganizationHooks: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token for viewing an organization's plan. Can be one of: `read`.
    public enum OrganizationPlan: String, Codable, CaseIterable {
        case read
    }

    /// The level of permission to grant the access token to manage organization projects and projects beta (where available). Can be one of: `read`, `write`, or `admin`.
    public enum OrganizationProjects: String, Codable, CaseIterable {
        case read
        case write
        case admin
    }

    /// The level of permission to grant the access token for organization packages published to GitHub Packages. Can be one of: `read` or `write`.
    public enum OrganizationPackages: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage organization secrets. Can be one of: `read` or `write`.
    public enum OrganizationSecrets: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to view and manage GitHub Actions self-hosted runners available to an organization. Can be one of: `read` or `write`.
    public enum OrganizationSelfHostedRunners: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to view and manage users blocked by the organization. Can be one of: `read` or `write`.
    public enum OrganizationUserBlocking: String, Codable, CaseIterable {
        case read
        case write
    }

    /// The level of permission to grant the access token to manage team discussions and related comments. Can be one of: `read` or `write`.
    public enum TeamDiscussions: String, Codable, CaseIterable {
        case read
        case write
    }

    public init(actions: Actions? = nil, administration: Administration? = nil, checks: Checks? = nil, contents: Contents? = nil, deployments: Deployments? = nil, environments: Environments? = nil, issues: Issues? = nil, metadata: Metadata? = nil, packages: Packages? = nil, pages: Pages? = nil, pullRequests: PullRequests? = nil, repositoryHooks: RepositoryHooks? = nil, repositoryProjects: RepositoryProjects? = nil, secretScanningAlerts: SecretScanningAlerts? = nil, secrets: Secrets? = nil, securityEvents: SecurityEvents? = nil, singleFile: SingleFile? = nil, statuses: Statuses? = nil, vulnerabilityAlerts: VulnerabilityAlerts? = nil, workflows: Workflows? = .write, members: Members? = nil, organizationAdministration: OrganizationAdministration? = nil, organizationHooks: OrganizationHooks? = nil, organizationPlan: OrganizationPlan? = .read, organizationProjects: OrganizationProjects? = nil, organizationPackages: OrganizationPackages? = nil, organizationSecrets: OrganizationSecrets? = nil, organizationSelfHostedRunners: OrganizationSelfHostedRunners? = nil, organizationUserBlocking: OrganizationUserBlocking? = nil, teamDiscussions: TeamDiscussions? = nil) {
        self.actions = actions
        self.administration = administration
        self.checks = checks
        self.contents = contents
        self.deployments = deployments
        self.environments = environments
        self.issues = issues
        self.metadata = metadata
        self.packages = packages
        self.pages = pages
        self.pullRequests = pullRequests
        self.repositoryHooks = repositoryHooks
        self.repositoryProjects = repositoryProjects
        self.secretScanningAlerts = secretScanningAlerts
        self.secrets = secrets
        self.securityEvents = securityEvents
        self.singleFile = singleFile
        self.statuses = statuses
        self.vulnerabilityAlerts = vulnerabilityAlerts
        self.workflows = workflows
        self.members = members
        self.organizationAdministration = organizationAdministration
        self.organizationHooks = organizationHooks
        self.organizationPlan = organizationPlan
        self.organizationProjects = organizationProjects
        self.organizationPackages = organizationPackages
        self.organizationSecrets = organizationSecrets
        self.organizationSelfHostedRunners = organizationSelfHostedRunners
        self.organizationUserBlocking = organizationUserBlocking
        self.teamDiscussions = teamDiscussions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.actions = try values.decodeIfPresent(Actions.self, forKey: "actions")
        self.administration = try values.decodeIfPresent(Administration.self, forKey: "administration")
        self.checks = try values.decodeIfPresent(Checks.self, forKey: "checks")
        self.contents = try values.decodeIfPresent(Contents.self, forKey: "contents")
        self.deployments = try values.decodeIfPresent(Deployments.self, forKey: "deployments")
        self.environments = try values.decodeIfPresent(Environments.self, forKey: "environments")
        self.issues = try values.decodeIfPresent(Issues.self, forKey: "issues")
        self.metadata = try values.decodeIfPresent(Metadata.self, forKey: "metadata")
        self.packages = try values.decodeIfPresent(Packages.self, forKey: "packages")
        self.pages = try values.decodeIfPresent(Pages.self, forKey: "pages")
        self.pullRequests = try values.decodeIfPresent(PullRequests.self, forKey: "pull_requests")
        self.repositoryHooks = try values.decodeIfPresent(RepositoryHooks.self, forKey: "repository_hooks")
        self.repositoryProjects = try values.decodeIfPresent(RepositoryProjects.self, forKey: "repository_projects")
        self.secretScanningAlerts = try values.decodeIfPresent(SecretScanningAlerts.self, forKey: "secret_scanning_alerts")
        self.secrets = try values.decodeIfPresent(Secrets.self, forKey: "secrets")
        self.securityEvents = try values.decodeIfPresent(SecurityEvents.self, forKey: "security_events")
        self.singleFile = try values.decodeIfPresent(SingleFile.self, forKey: "single_file")
        self.statuses = try values.decodeIfPresent(Statuses.self, forKey: "statuses")
        self.vulnerabilityAlerts = try values.decodeIfPresent(VulnerabilityAlerts.self, forKey: "vulnerability_alerts")
        self.workflows = try values.decodeIfPresent(Workflows.self, forKey: "workflows") ?? .write
        self.members = try values.decodeIfPresent(Members.self, forKey: "members")
        self.organizationAdministration = try values.decodeIfPresent(OrganizationAdministration.self, forKey: "organization_administration")
        self.organizationHooks = try values.decodeIfPresent(OrganizationHooks.self, forKey: "organization_hooks")
        self.organizationPlan = try values.decodeIfPresent(OrganizationPlan.self, forKey: "organization_plan") ?? .read
        self.organizationProjects = try values.decodeIfPresent(OrganizationProjects.self, forKey: "organization_projects")
        self.organizationPackages = try values.decodeIfPresent(OrganizationPackages.self, forKey: "organization_packages")
        self.organizationSecrets = try values.decodeIfPresent(OrganizationSecrets.self, forKey: "organization_secrets")
        self.organizationSelfHostedRunners = try values.decodeIfPresent(OrganizationSelfHostedRunners.self, forKey: "organization_self_hosted_runners")
        self.organizationUserBlocking = try values.decodeIfPresent(OrganizationUserBlocking.self, forKey: "organization_user_blocking")
        self.teamDiscussions = try values.decodeIfPresent(TeamDiscussions.self, forKey: "team_discussions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(actions, forKey: "actions")
        try values.encodeIfPresent(administration, forKey: "administration")
        try values.encodeIfPresent(checks, forKey: "checks")
        try values.encodeIfPresent(contents, forKey: "contents")
        try values.encodeIfPresent(deployments, forKey: "deployments")
        try values.encodeIfPresent(environments, forKey: "environments")
        try values.encodeIfPresent(issues, forKey: "issues")
        try values.encodeIfPresent(metadata, forKey: "metadata")
        try values.encodeIfPresent(packages, forKey: "packages")
        try values.encodeIfPresent(pages, forKey: "pages")
        try values.encodeIfPresent(pullRequests, forKey: "pull_requests")
        try values.encodeIfPresent(repositoryHooks, forKey: "repository_hooks")
        try values.encodeIfPresent(repositoryProjects, forKey: "repository_projects")
        try values.encodeIfPresent(secretScanningAlerts, forKey: "secret_scanning_alerts")
        try values.encodeIfPresent(secrets, forKey: "secrets")
        try values.encodeIfPresent(securityEvents, forKey: "security_events")
        try values.encodeIfPresent(singleFile, forKey: "single_file")
        try values.encodeIfPresent(statuses, forKey: "statuses")
        try values.encodeIfPresent(vulnerabilityAlerts, forKey: "vulnerability_alerts")
        try values.encodeIfPresent(workflows, forKey: "workflows")
        try values.encodeIfPresent(members, forKey: "members")
        try values.encodeIfPresent(organizationAdministration, forKey: "organization_administration")
        try values.encodeIfPresent(organizationHooks, forKey: "organization_hooks")
        try values.encodeIfPresent(organizationPlan, forKey: "organization_plan")
        try values.encodeIfPresent(organizationProjects, forKey: "organization_projects")
        try values.encodeIfPresent(organizationPackages, forKey: "organization_packages")
        try values.encodeIfPresent(organizationSecrets, forKey: "organization_secrets")
        try values.encodeIfPresent(organizationSelfHostedRunners, forKey: "organization_self_hosted_runners")
        try values.encodeIfPresent(organizationUserBlocking, forKey: "organization_user_blocking")
        try values.encodeIfPresent(teamDiscussions, forKey: "team_discussions")
    }
}
