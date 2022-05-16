// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let record = try Record(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseRecord { response in
//     if let record = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire
import RealmSwift

// MARK: - Record
struct Record: Codable {
    let datasetid, recordid: String?
    let fields: Fields?
    let geometry: Geometry?
    let recordTimestamp: String?

    enum CodingKeys: String, CodingKey {
        case datasetid, recordid, fields, geometry
        case recordTimestamp = "record_timestamp"
    }
}

// MARK: Record convenience initializers and mutators

extension Record {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Record.self, from: data)
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
        datasetid: String?? = nil,
        recordid: String?? = nil,
        fields: Fields?? = nil,
        geometry: Geometry?? = nil,
        recordTimestamp: String?? = nil
    ) -> Record {
        return Record(
            datasetid: datasetid ?? self.datasetid,
            recordid: recordid ?? self.recordid,
            fields: fields ?? self.fields,
            geometry: geometry ?? self.geometry,
            recordTimestamp: recordTimestamp ?? self.recordTimestamp
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Record: Persistable {

    public func managedObject() -> ArbreDB {

        let arbre = ArbreDB()
        arbre.id = recordid ?? ""
        arbre.name = fields?.libellefrancais ?? ""
        arbre.height = fields?.hauteurenm ?? 0
        arbre.address = fields?.adresse ?? ""
        arbre.circumference = fields?.circonferenceencm ?? 0
        arbre.specie = fields?.espece ?? ""
        arbre.geoPoint2d.append(fields?.geoPoint2D?[0] ?? 0.0)
        arbre.geoPoint2d.append(fields?.geoPoint2D?[1] ?? 0.0)

        return arbre
    }
}
