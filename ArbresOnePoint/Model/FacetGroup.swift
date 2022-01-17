// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let facetGroup = try FacetGroup(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFacetGroup { response in
//     if let facetGroup = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - FacetGroup
struct FacetGroup: Codable {
    let name: String?
    let facets: [Facet]?
}

// MARK: FacetGroup convenience initializers and mutators

extension FacetGroup {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FacetGroup.self, from: data)
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
        facets: [Facet]?? = nil
    ) -> FacetGroup {
        return FacetGroup(
            name: name ?? self.name,
            facets: facets ?? self.facets
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
