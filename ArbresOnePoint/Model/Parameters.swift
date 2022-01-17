// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parameters = try Parameters(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseParameters { response in
//     if let parameters = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Parameters
struct Parameters: Codable {
    let dataset: String?
    let rows, start: Int?
    let facet: [String]?
    let format, timezone: String?
}

// MARK: Parameters convenience initializers and mutators

extension Parameters {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Parameters.self, from: data)
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
        dataset: String?? = nil,
        rows: Int?? = nil,
        start: Int?? = nil,
        facet: [String]?? = nil,
        format: String?? = nil,
        timezone: String?? = nil
    ) -> Parameters {
        return Parameters(
            dataset: dataset ?? self.dataset,
            rows: rows ?? self.rows,
            start: start ?? self.start,
            facet: facet ?? self.facet,
            format: format ?? self.format,
            timezone: timezone ?? self.timezone
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
