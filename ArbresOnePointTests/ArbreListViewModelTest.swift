//
//  ArbreListViewModelTest.swift
//  Arbres One PointTests
//
//  Created by Otourou Da Costa on 15/01/2022.
//

import XCTest
import RealmSwift
@testable import ArbresOnePoint

class ArbreListViewModelTest: XCTestCase {

    var dataRepository: DataRepository!
    var viewModel: ArbreListViewModel!

    override func setUpWithError() throws {
        // To avoid overriding application data or leaking state between tests
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        dataRepository = DataRepository()
        viewModel = ArbreListViewModel()
    }

    override func tearDownWithError() throws {
        dataRepository.deleteAll()
        dataRepository = nil
        viewModel = nil
    }

    func testListContains20Elements() {
        for index in 1...20 {
            dataRepository.add(arbresToAdd: Record(
                datasetid: "\(index)",
                recordid: "\(index)",
                fields: Fields(
                    hauteurenm: 1,
                    libellefrancais: "A",
                    idemplacement: "\(index)",
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
                    idbase: index,
                    arrondissement: "",
                    varieteoucultivar: ""
                ),
                geometry: Geometry(type: "arbre", coordinates: [1.0, 1.0]),
                recordTimestamp: "1"))
        }
        XCTAssert(viewModel.filteredArbresResults.count == 20)
    }

}
