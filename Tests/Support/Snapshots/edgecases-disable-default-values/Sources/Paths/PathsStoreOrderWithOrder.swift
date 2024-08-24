// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Store.Order {
    public func orderID(_ orderID: Int) -> WithOrder {
        WithOrder(path: "\(path)/order-\(orderID)")
    }

    public struct WithOrder {
        /// Path: `/store/order/order-{order_id}`
        public let path: String

        /// Find purchase order by ID
        ///
        /// For valid response try integer IDs with value <= 5 or > 10. Other values will generated exceptions
        public var get: Request<edgecases_disable_default_values.Order> {
            Request(path: path, method: "GET", id: "getOrderById")
        }

        /// Delete purchase order by ID
        ///
        /// For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "deleteOrder")
        }
    }
}