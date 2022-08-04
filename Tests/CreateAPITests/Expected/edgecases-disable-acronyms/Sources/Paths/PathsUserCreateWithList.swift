// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User {
    public var createWithList: CreateWithList {
        CreateWithList(path: path + "/createWithList")
    }

    public struct CreateWithList {
        /// Path: `/user/createWithList`
        public let path: String

        /// Creates list of users with given input array
        public func post(_ body: [edgecases_disable_acronyms.User]) -> Request<Void> {
            Request(method: "POST", url: path, body: body, id: "createUsersWithListInput")
        }
    }
}
