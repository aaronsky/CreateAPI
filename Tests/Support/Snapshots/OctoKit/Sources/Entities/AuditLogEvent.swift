// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct AuditLogEvent: Codable {
    /// The time the audit log event occurred, given as a [Unix timestamp](http://en.wikipedia.org/wiki/Unix_time).
    public var timestamp: Int?
    /// The name of the action that was performed, for example `user.login` or `repo.create`.
    public var action: String?
    public var isActive: Bool?
    public var activeWas: Bool?
    /// The actor who performed the action.
    public var actor: String?
    /// The id of the actor who performed the action.
    public var actorID: Int?
    public var actorLocation: ActorLocation?
    public var data: [String: AnyJSON]?
    public var orgID: Int?
    /// The username of the account being blocked.
    public var blockedUser: String?
    public var business: String?
    public var config: [[String: AnyJSON]]?
    public var configWas: [[String: AnyJSON]]?
    public var contentType: String?
    /// The time the audit log event was recorded, given as a [Unix timestamp](http://en.wikipedia.org/wiki/Unix_time).
    public var createdAt: Int?
    public var deployKeyFingerprint: String?
    /// A unique identifier for an audit event.
    public var documentID: String?
    public var emoji: String?
    public var events: [[String: AnyJSON]]?
    public var eventsWere: [[String: AnyJSON]]?
    public var explanation: String?
    public var fingerprint: String?
    public var hookID: Int?
    public var isLimitedAvailability: Bool?
    public var message: String?
    public var name: String?
    public var oldUser: String?
    public var opensshPublicKey: String?
    public var org: String?
    public var previousVisibility: String?
    public var isReadOnly: Bool?
    /// The name of the repository.
    public var repo: String?
    /// The name of the repository.
    public var repository: String?
    public var isRepositoryPublic: Bool?
    public var targetLogin: String?
    public var team: String?
    /// The type of protocol (for example, HTTP or SSH) used to transfer Git data.
    public var transportProtocol: Int?
    /// A human readable name for the protocol (for example, HTTP or SSH) used to transfer Git data.
    public var transportProtocolName: String?
    /// The user that was affected by the action performed (if available).
    public var user: String?
    /// The repository visibility, for example `public` or `private`.
    public var visibility: String?

    public struct ActorLocation: Codable {
        public var countryName: String?

        public init(countryName: String? = nil) {
            self.countryName = countryName
        }

        public init(from decoder: any Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.countryName = try values.decodeIfPresent(String.self, forKey: "country_name")
        }

        public func encode(to encoder: any Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(countryName, forKey: "country_name")
        }
    }

    public init(timestamp: Int? = nil, action: String? = nil, isActive: Bool? = nil, activeWas: Bool? = nil, actor: String? = nil, actorID: Int? = nil, actorLocation: ActorLocation? = nil, data: [String: AnyJSON]? = nil, orgID: Int? = nil, blockedUser: String? = nil, business: String? = nil, config: [[String: AnyJSON]]? = nil, configWas: [[String: AnyJSON]]? = nil, contentType: String? = nil, createdAt: Int? = nil, deployKeyFingerprint: String? = nil, documentID: String? = nil, emoji: String? = nil, events: [[String: AnyJSON]]? = nil, eventsWere: [[String: AnyJSON]]? = nil, explanation: String? = nil, fingerprint: String? = nil, hookID: Int? = nil, isLimitedAvailability: Bool? = nil, message: String? = nil, name: String? = nil, oldUser: String? = nil, opensshPublicKey: String? = nil, org: String? = nil, previousVisibility: String? = nil, isReadOnly: Bool? = nil, repo: String? = nil, repository: String? = nil, isRepositoryPublic: Bool? = nil, targetLogin: String? = nil, team: String? = nil, transportProtocol: Int? = nil, transportProtocolName: String? = nil, user: String? = nil, visibility: String? = nil) {
        self.timestamp = timestamp
        self.action = action
        self.isActive = isActive
        self.activeWas = activeWas
        self.actor = actor
        self.actorID = actorID
        self.actorLocation = actorLocation
        self.data = data
        self.orgID = orgID
        self.blockedUser = blockedUser
        self.business = business
        self.config = config
        self.configWas = configWas
        self.contentType = contentType
        self.createdAt = createdAt
        self.deployKeyFingerprint = deployKeyFingerprint
        self.documentID = documentID
        self.emoji = emoji
        self.events = events
        self.eventsWere = eventsWere
        self.explanation = explanation
        self.fingerprint = fingerprint
        self.hookID = hookID
        self.isLimitedAvailability = isLimitedAvailability
        self.message = message
        self.name = name
        self.oldUser = oldUser
        self.opensshPublicKey = opensshPublicKey
        self.org = org
        self.previousVisibility = previousVisibility
        self.isReadOnly = isReadOnly
        self.repo = repo
        self.repository = repository
        self.isRepositoryPublic = isRepositoryPublic
        self.targetLogin = targetLogin
        self.team = team
        self.transportProtocol = transportProtocol
        self.transportProtocolName = transportProtocolName
        self.user = user
        self.visibility = visibility
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.timestamp = try values.decodeIfPresent(Int.self, forKey: "@timestamp")
        self.action = try values.decodeIfPresent(String.self, forKey: "action")
        self.isActive = try values.decodeIfPresent(Bool.self, forKey: "active")
        self.activeWas = try values.decodeIfPresent(Bool.self, forKey: "active_was")
        self.actor = try values.decodeIfPresent(String.self, forKey: "actor")
        self.actorID = try values.decodeIfPresent(Int.self, forKey: "actor_id")
        self.actorLocation = try values.decodeIfPresent(ActorLocation.self, forKey: "actor_location")
        self.data = try values.decodeIfPresent([String: AnyJSON].self, forKey: "data")
        self.orgID = try values.decodeIfPresent(Int.self, forKey: "org_id")
        self.blockedUser = try values.decodeIfPresent(String.self, forKey: "blocked_user")
        self.business = try values.decodeIfPresent(String.self, forKey: "business")
        self.config = try values.decodeIfPresent([[String: AnyJSON]].self, forKey: "config")
        self.configWas = try values.decodeIfPresent([[String: AnyJSON]].self, forKey: "config_was")
        self.contentType = try values.decodeIfPresent(String.self, forKey: "content_type")
        self.createdAt = try values.decodeIfPresent(Int.self, forKey: "created_at")
        self.deployKeyFingerprint = try values.decodeIfPresent(String.self, forKey: "deploy_key_fingerprint")
        self.documentID = try values.decodeIfPresent(String.self, forKey: "_document_id")
        self.emoji = try values.decodeIfPresent(String.self, forKey: "emoji")
        self.events = try values.decodeIfPresent([[String: AnyJSON]].self, forKey: "events")
        self.eventsWere = try values.decodeIfPresent([[String: AnyJSON]].self, forKey: "events_were")
        self.explanation = try values.decodeIfPresent(String.self, forKey: "explanation")
        self.fingerprint = try values.decodeIfPresent(String.self, forKey: "fingerprint")
        self.hookID = try values.decodeIfPresent(Int.self, forKey: "hook_id")
        self.isLimitedAvailability = try values.decodeIfPresent(Bool.self, forKey: "limited_availability")
        self.message = try values.decodeIfPresent(String.self, forKey: "message")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.oldUser = try values.decodeIfPresent(String.self, forKey: "old_user")
        self.opensshPublicKey = try values.decodeIfPresent(String.self, forKey: "openssh_public_key")
        self.org = try values.decodeIfPresent(String.self, forKey: "org")
        self.previousVisibility = try values.decodeIfPresent(String.self, forKey: "previous_visibility")
        self.isReadOnly = try values.decodeIfPresent(Bool.self, forKey: "read_only")
        self.repo = try values.decodeIfPresent(String.self, forKey: "repo")
        self.repository = try values.decodeIfPresent(String.self, forKey: "repository")
        self.isRepositoryPublic = try values.decodeIfPresent(Bool.self, forKey: "repository_public")
        self.targetLogin = try values.decodeIfPresent(String.self, forKey: "target_login")
        self.team = try values.decodeIfPresent(String.self, forKey: "team")
        self.transportProtocol = try values.decodeIfPresent(Int.self, forKey: "transport_protocol")
        self.transportProtocolName = try values.decodeIfPresent(String.self, forKey: "transport_protocol_name")
        self.user = try values.decodeIfPresent(String.self, forKey: "user")
        self.visibility = try values.decodeIfPresent(String.self, forKey: "visibility")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(timestamp, forKey: "@timestamp")
        try values.encodeIfPresent(action, forKey: "action")
        try values.encodeIfPresent(isActive, forKey: "active")
        try values.encodeIfPresent(activeWas, forKey: "active_was")
        try values.encodeIfPresent(actor, forKey: "actor")
        try values.encodeIfPresent(actorID, forKey: "actor_id")
        try values.encodeIfPresent(actorLocation, forKey: "actor_location")
        try values.encodeIfPresent(data, forKey: "data")
        try values.encodeIfPresent(orgID, forKey: "org_id")
        try values.encodeIfPresent(blockedUser, forKey: "blocked_user")
        try values.encodeIfPresent(business, forKey: "business")
        try values.encodeIfPresent(config, forKey: "config")
        try values.encodeIfPresent(configWas, forKey: "config_was")
        try values.encodeIfPresent(contentType, forKey: "content_type")
        try values.encodeIfPresent(createdAt, forKey: "created_at")
        try values.encodeIfPresent(deployKeyFingerprint, forKey: "deploy_key_fingerprint")
        try values.encodeIfPresent(documentID, forKey: "_document_id")
        try values.encodeIfPresent(emoji, forKey: "emoji")
        try values.encodeIfPresent(events, forKey: "events")
        try values.encodeIfPresent(eventsWere, forKey: "events_were")
        try values.encodeIfPresent(explanation, forKey: "explanation")
        try values.encodeIfPresent(fingerprint, forKey: "fingerprint")
        try values.encodeIfPresent(hookID, forKey: "hook_id")
        try values.encodeIfPresent(isLimitedAvailability, forKey: "limited_availability")
        try values.encodeIfPresent(message, forKey: "message")
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(oldUser, forKey: "old_user")
        try values.encodeIfPresent(opensshPublicKey, forKey: "openssh_public_key")
        try values.encodeIfPresent(org, forKey: "org")
        try values.encodeIfPresent(previousVisibility, forKey: "previous_visibility")
        try values.encodeIfPresent(isReadOnly, forKey: "read_only")
        try values.encodeIfPresent(repo, forKey: "repo")
        try values.encodeIfPresent(repository, forKey: "repository")
        try values.encodeIfPresent(isRepositoryPublic, forKey: "repository_public")
        try values.encodeIfPresent(targetLogin, forKey: "target_login")
        try values.encodeIfPresent(team, forKey: "team")
        try values.encodeIfPresent(transportProtocol, forKey: "transport_protocol")
        try values.encodeIfPresent(transportProtocolName, forKey: "transport_protocol_name")
        try values.encodeIfPresent(user, forKey: "user")
        try values.encodeIfPresent(visibility, forKey: "visibility")
    }
}
