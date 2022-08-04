// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var feeds: Feeds {
        Feeds(path: "/feeds")
    }

    public struct Feeds {
        /// Path: `/feeds`
        public let path: String

        /// Get feeds
        ///
        /// GitHub provides several timeline resources in [Atom](http://en.wikipedia.org/wiki/Atom_(standard)) format. The Feeds API lists all the feeds available to the authenticated user:
        /// 
        /// *   **Timeline**: The GitHub global public timeline
        /// *   **User**: The public timeline for any user, using [URI template](https://docs.github.com/rest/overview/resources-in-the-rest-api#hypermedia)
        /// *   **Current user public**: The public timeline for the authenticated user
        /// *   **Current user**: The private timeline for the authenticated user
        /// *   **Current user actor**: The private timeline for activity created by the authenticated user
        /// *   **Current user organizations**: The private timeline for the organizations the authenticated user is a member of.
        /// *   **Security advisories**: A collection of public announcements that provide information about security-related vulnerabilities in software on GitHub.
        /// 
        /// **Note**: Private feeds are only returned when [authenticating via Basic Auth](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) since current feed URIs use the older, non revocable auth tokens.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/activity#get-feeds)
        public var get: Request<OctoKit.Feed> {
            Request(method: "GET", url: path, id: "activity/get-feeds")
        }
    }
}
