// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fields = try Fields(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFields { response in
//     if let fields = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Fields
struct Fields: Codable {
    let hauteurenm: Int?
    let libellefrancais, idemplacement, complementadresse: String?
    let circonferenceencm: Int?
    let geoPoint2D: [Double]?
    let espece, typeemplacement, genre, adresse: String?
    let stadedeveloppement, domanialite, remarquable: String?
    let idbase: Int?
    let arrondissement, varieteoucultivar: String?

    enum CodingKeys: String, CodingKey {
        case hauteurenm, libellefrancais, idemplacement, complementadresse, circonferenceencm
        case geoPoint2D = "geo_point_2d"
        case espece, typeemplacement, genre, adresse, stadedeveloppement, domanialite, remarquable
        case idbase, arrondissement, varieteoucultivar
    }
}

// MARK: Fields convenience initializers and mutators

extension Fields {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Fields.self, from: data)
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
        hauteurenm: Int?? = nil,
        libellefrancais: String?? = nil,
        idemplacement: String?? = nil,
        complementadresse: String?? = nil,
        circonferenceencm: Int?? = nil,
        geoPoint2D: [Double]?? = nil,
        espece: String?? = nil,
        typeemplacement: String?? = nil,
        genre: String?? = nil,
        adresse: String?? = nil,
        stadedeveloppement: String?? = nil,
        domanialite: String?? = nil,
        remarquable: String?? = nil,
        idbase: Int?? = nil,
        arrondissement: String?? = nil,
        varieteoucultivar: String?? = nil
    ) -> Fields {
        return Fields(
            hauteurenm: hauteurenm ?? self.hauteurenm,
            libellefrancais: libellefrancais ?? self.libellefrancais,
            idemplacement: idemplacement ?? self.idemplacement,
            complementadresse: complementadresse ?? self.complementadresse,
            circonferenceencm: circonferenceencm ?? self.circonferenceencm,
            geoPoint2D: geoPoint2D ?? self.geoPoint2D,
            espece: espece ?? self.espece,
            typeemplacement: typeemplacement ?? self.typeemplacement,
            genre: genre ?? self.genre,
            adresse: adresse ?? self.adresse,
            stadedeveloppement: stadedeveloppement ?? self.stadedeveloppement,
            domanialite: domanialite ?? self.domanialite,
            remarquable: remarquable ?? self.remarquable,
            idbase: idbase ?? self.idbase,
            arrondissement: arrondissement ?? self.arrondissement,
            varieteoucultivar: varieteoucultivar ?? self.varieteoucultivar
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
