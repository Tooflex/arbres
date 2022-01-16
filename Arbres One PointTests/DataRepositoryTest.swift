//
//  DataRepositoryTest.swift
//  Arbres One PointTests
//
//  Created by Otourou Da Costa on 15/01/2022.
//

import XCTest
@testable import Arbres_One_Point

class DataRepositoryTest: XCTestCase {
    var dataRepository: DataRepository!

    override func setUpWithError() throws {
        dataRepository = DataRepository()
    }

    override func tearDownWithError() throws {
        dataRepository.deleteAll()
        dataRepository = nil
    }

    func testAddArbre() throws {
        var arbreToAdd = Record(
            datasetId: "1",
            recordId: "1",
            fields: Fields(
                hauteurEnM: 1,
                libelleFrancais: "A",
                idEmplacement: "1",
                circonferenceEnCm: 1,
                geoPoint2D: [1.0, 1.0],
                espece: "especeTest",
                typeEmplacement: "type emplacement test",
                genre: "genre test",
                adresse: "1 rue adresse",
                stadeDeveloppement: "", domanialite: "",
                remarquable: "",
                idBase: 1,
                arrondissement: ""
            ),
            geometry: Geometry(type: "arbre", coordinates: [1.0, 1.0]),
            recordTimestamp: "1"
        )

        dataRepository.add(arbre: arbreToAdd)
        let fetchedArbres = dataRepository.fetchArbre(type: Record.class)

        XCTAssert(!fetchedArbres.isEmpty)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
