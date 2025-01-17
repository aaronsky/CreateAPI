// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ActionsEnterprisePermissions: Codable {
    /// The policy that controls the organizations in the enterprise that are allowed to run GitHub Actions. Can be one of: `all`, `none`, or `selected`.
    public var enabledOrganizations: EnabledOrganizations
    /// The API URL to use to get or set the selected organizations that are allowed to run GitHub Actions, when `enabled_organizations` is set to `selected`.
    public var selectedOrganizationsURL: String?
    /// The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
    public var allowedActions: AllowedActions?
    /// The API URL to use to get or set the actions that are allowed to run, when `allowed_actions` is set to `selected`.
    public var selectedActionsURL: String?

    public init(enabledOrganizations: EnabledOrganizations, selectedOrganizationsURL: String? = nil, allowedActions: AllowedActions? = nil, selectedActionsURL: String? = nil) {
        self.enabledOrganizations = enabledOrganizations
        self.selectedOrganizationsURL = selectedOrganizationsURL
        self.allowedActions = allowedActions
        self.selectedActionsURL = selectedActionsURL
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enabledOrganizations = try values.decode(EnabledOrganizations.self, forKey: "enabled_organizations")
        self.selectedOrganizationsURL = try values.decodeIfPresent(String.self, forKey: "selected_organizations_url")
        self.allowedActions = try values.decodeIfPresent(AllowedActions.self, forKey: "allowed_actions")
        self.selectedActionsURL = try values.decodeIfPresent(String.self, forKey: "selected_actions_url")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(enabledOrganizations, forKey: "enabled_organizations")
        try values.encodeIfPresent(selectedOrganizationsURL, forKey: "selected_organizations_url")
        try values.encodeIfPresent(allowedActions, forKey: "allowed_actions")
        try values.encodeIfPresent(selectedActionsURL, forKey: "selected_actions_url")
    }
}
