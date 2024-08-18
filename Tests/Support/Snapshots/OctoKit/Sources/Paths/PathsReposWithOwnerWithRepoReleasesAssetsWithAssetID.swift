// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Releases.Assets {
    public func assetID(_ assetID: Int) -> WithAssetID {
        WithAssetID(path: "\(path)/\(assetID)")
    }

    public struct WithAssetID {
        /// Path: `/repos/{owner}/{repo}/releases/assets/{asset_id}`
        public let path: String

        /// Get a release asset
        ///
        /// To download the asset's binary content, set the `Accept` header of the request to [`application/octet-stream`](https://docs.github.com/rest/overview/media-types). The API will either redirect the client to the location, or stream it directly if possible. API clients should handle both a `200` or `302` response.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-a-release-asset)
        public var get: Request<OctoKit.ReleaseAsset> {
            Request(path: path, method: "GET", id: "repos/get-release-asset")
        }

        /// Update a release asset
        ///
        /// Users with push access to the repository can edit a release asset.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#update-a-release-asset)
        public func patch(_ body: PatchRequest? = nil) -> Request<OctoKit.ReleaseAsset> {
            Request(path: path, method: "PATCH", body: body, id: "repos/update-release-asset")
        }

        public struct PatchRequest: Encodable {
            /// The file name of the asset.
            public var name: String?
            /// An alternate short description of the asset. Used in place of the filename.
            public var label: String?
            /// Example: "uploaded"
            public var state: String?

            public init(name: String? = nil, label: String? = nil, state: String? = nil) {
                self.name = name
                self.label = label
                self.state = state
            }

            public func encode(to encoder: any Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(name, forKey: "name")
                try values.encodeIfPresent(label, forKey: "label")
                try values.encodeIfPresent(state, forKey: "state")
            }
        }

        /// Delete a release asset
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#delete-a-release-asset)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "repos/delete-release-asset")
        }
    }
}
