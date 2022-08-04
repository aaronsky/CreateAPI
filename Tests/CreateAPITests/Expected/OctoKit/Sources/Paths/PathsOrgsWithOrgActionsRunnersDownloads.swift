// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Actions.Runners {
    public var downloads: Downloads {
        Downloads(path: path + "/downloads")
    }

    public struct Downloads {
        /// Path: `/orgs/{org}/actions/runners/downloads`
        public let path: String

        /// List runner applications for an organization
        ///
        /// Lists binaries for the runner application that you can download and run.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#list-runner-applications-for-an-organization)
        public var get: Request<[OctoKit.RunnerApplication]> {
            Request(method: "GET", url: path, id: "actions/list-runner-applications-for-org")
        }
    }
}
