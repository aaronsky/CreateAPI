// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

struct HasOnlyReadOnly: Codable {
    var bar: String?
    var foo: String?

    init(bar: String? = nil, foo: String? = nil) {
        self.bar = bar
        self.foo = foo
    }

    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.bar = try values.decodeIfPresent(String.self, forKey: "bar")
        self.foo = try values.decodeIfPresent(String.self, forKey: "foo")
    }

    func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(bar, forKey: "bar")
        try values.encodeIfPresent(foo, forKey: "foo")
    }
}
