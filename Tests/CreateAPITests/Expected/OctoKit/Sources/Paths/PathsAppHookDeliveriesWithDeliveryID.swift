// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.App.Hook.Deliveries {
    public func deliveryID(_ deliveryID: Int) -> WithDeliveryID {
        WithDeliveryID(path: "\(path)/\(deliveryID)")
    }

    public struct WithDeliveryID {
        /// Path: `/app/hook/deliveries/{delivery_id}`
        public let path: String

        /// Get a delivery for an app webhook
        ///
        /// Returns a delivery for the webhook configured for a GitHub App.
        /// 
        /// You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/apps#get-a-delivery-for-an-app-webhook)
        public var get: Request<OctoKit.HookDelivery> {
            Request(method: "GET", url: path, id: "apps/get-webhook-delivery")
        }
    }
}
