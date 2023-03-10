// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Order: Codable {
    public var id: Int64?
    public var petID: Int64?
    public var quantity: Int32?
    public var shipDate: Date?
    /// Order Status
    public var status: Status?
    public var isComplete: Bool?

    /// Order Status
    public enum Status: String, CaseIterable, Codable {
        case placed
        case approved
        case delivered
    }

    public init(id: Int64?, petID: Int64?, quantity: Int32?, shipDate: Date?, status: Status?, isComplete: Bool?) {
        self.id = id
        self.petID = petID
        self.quantity = quantity
        self.shipDate = shipDate
        self.status = status
        self.isComplete = isComplete
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int64.self, forKey: "id")
        self.petID = try values.decodeIfPresent(Int64.self, forKey: "petId")
        self.quantity = try values.decodeIfPresent(Int32.self, forKey: "quantity")
        self.shipDate = try values.decodeIfPresent(Date.self, forKey: "shipDate")
        self.status = try values.decodeIfPresent(Status.self, forKey: "status")
        self.isComplete = try values.decodeIfPresent(Bool.self, forKey: "complete")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(petID, forKey: "petId")
        try values.encodeIfPresent(quantity, forKey: "quantity")
        try values.encodeIfPresent(shipDate, forKey: "shipDate")
        try values.encodeIfPresent(status, forKey: "status")
        try values.encodeIfPresent(isComplete, forKey: "complete")
    }
}
