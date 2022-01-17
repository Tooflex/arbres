// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let facet = try Facet(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFacet { response in
//     if let facet = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Facet
struct Facet: Codable {
    let name: String?
    let count: Int?
    let state, path: String?
}

// MARK: Facet convenience initializers and mutators

extension Facet {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Facet.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String?? = nil,
        count: Int?? = nil,
        state: String?? = nil,
        path: String?? = nil
    ) -> Facet {
        return Facet(
            name: name ?? self.name,
            count: count ?? self.count,
            state: state ?? self.state,
            path: path ?? self.path
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
