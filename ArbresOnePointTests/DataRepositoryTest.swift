//
//  DataRepositoryTest.swift
//  Arbres One PointTests
//
//  Created by Otourou Da Costa on 15/01/2022.
//

import XCTest
import RealmSwift
@testable import ArbresOnePoint

class DataRepositoryTest: XCTestCase {
    var dataRepository: DataRepository!

    override func setUpWithError() throws {
        // To avoid overriding application data or leaking state between tests
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        dataRepository = DataRepository()
    }

    override func tearDownWithError() throws {
        dataRepository.deleteAll()
        dataRepository = nil
    }

    func testAddArbre() throws {
        let arbreToAdd = Record(
            datasetid: "1",
            recordid: "1",
            fields: Fields(
                hauteurenm: 1,
                libellefrancais: "A",
                idemplacement: "1",
                complementadresse: "",
                circonferenceencm: 1,
                geoPoint2D: [1.0, 1.0],
                espece: "type emplacement test",
                typeemplacement: "genre test",
                genre: "1 rue adresse",
                adresse: "",
                stadedeveloppement: "",
                domanialite: "",
                remarquable: "",
                idbase: 1,
                arrondissement: "",
                varieteoucultivar: ""
            ),
            geometry: Geometry(type: "arbre", coordinates: [1.0, 1.0]),
            recordTimestamp: "1"
        )

        dataRepository.add(arbresToAdd: arbreToAdd)
        let fetchedArbres = dataRepository.fetchLocalData(type: ArbreDB.self)

        XCTAssert(!fetchedArbres.isEmpty)
    }

}
