// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct CombinedBillingUsage: Codable {
    /// Numbers of days left in billing cycle.
    public var daysLeftInBillingCycle: Int
    /// Estimated storage space (GB) used in billing cycle.
    public var estimatedPaidStorageForMonth: Int
    /// Estimated sum of free and paid storage space (GB) used in billing cycle.
    public var estimatedStorageForMonth: Int

    public init(daysLeftInBillingCycle: Int, estimatedPaidStorageForMonth: Int, estimatedStorageForMonth: Int) {
        self.daysLeftInBillingCycle = daysLeftInBillingCycle
        self.estimatedPaidStorageForMonth = estimatedPaidStorageForMonth
        self.estimatedStorageForMonth = estimatedStorageForMonth
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.daysLeftInBillingCycle = try values.decode(Int.self, forKey: "days_left_in_billing_cycle")
        self.estimatedPaidStorageForMonth = try values.decode(Int.self, forKey: "estimated_paid_storage_for_month")
        self.estimatedStorageForMonth = try values.decode(Int.self, forKey: "estimated_storage_for_month")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(daysLeftInBillingCycle, forKey: "days_left_in_billing_cycle")
        try values.encode(estimatedPaidStorageForMonth, forKey: "estimated_paid_storage_for_month")
        try values.encode(estimatedStorageForMonth, forKey: "estimated_storage_for_month")
    }
}
