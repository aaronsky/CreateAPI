// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Settings.Billing {
    public var advancedSecurity: AdvancedSecurity {
        AdvancedSecurity(path: path + "/advanced-security")
    }

    public struct AdvancedSecurity {
        /// Path: `/orgs/{org}/settings/billing/advanced-security`
        public let path: String

        /// Get GitHub Advanced Security active committers for an organization
        ///
        /// Gets the GitHub Advanced Security active committers for an organization per repository.
        /// Each distinct user login across all repositories is counted as a single Advanced Security seat, so the total_advanced_security_committers is not the sum of advanced_security_committers for each repository.
        /// If this organization defers to an enterprise for billing, the total_advanced_security_committers returned from the organization API may include some users that are in more than one organization, so they will only consume a single Advanced Security seat at the enterprise level.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/billing#get-github-advanced-security-active-committers-for-an-organization)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<OctoKit.AdvancedSecurityActiveCommitters> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "billing/get-github-advanced-security-billing-org")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }
    }
}
