// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Pet {
    public var findByStatus: FindByStatus {
        FindByStatus(path: path + "/findByStatus")
    }

    public struct FindByStatus {
        /// Path: `/pet/findByStatus`
        public let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        public func get(status: [Status]) -> Request<[edgecases_multipart_formdata.Pet]> {
            Request(path: path, method: "GET", query: makeGetQuery(status), id: "findPetsByStatus")
        }

        private func makeGetQuery(_ status: [Status]) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(status, forKey: "status", explode: false)
            return encoder.items
        }

        public enum Status: String, CaseIterable, Codable {
            case available
            case pending
            case sold
        }
    }
}
