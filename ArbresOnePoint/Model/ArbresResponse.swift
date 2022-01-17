// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let arbresResponse = try ArbresResponse(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseArbresResponse { response in
//     if let arbresResponse = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - ArbresResponse
struct ArbresResponse: Codable {
    let nhits: Int?
    let parameters: Parameters?
    let records: [Record]?
    let facetGroups: [FacetGroup]?

    enum CodingKeys: String, CodingKey {
        case nhits, parameters, records
        case facetGroups = "facet_groups"
    }
}

// MARK: ArbresResponse convenience initializers and mutators

extension ArbresResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ArbresResponse.self, from: data)
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
        nhits: Int?? = nil,
        parameters: Parameters?? = nil,
        records: [Record]?? = nil,
        facetGroups: [FacetGroup]?? = nil
    ) -> ArbresResponse {
        return ArbresResponse(
            nhits: nhits ?? self.nhits,
            parameters: parameters ?? self.parameters,
            records: records ?? self.records,
            facetGroups: facetGroups ?? self.facetGroups
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
