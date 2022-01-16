//
//  ArbreListViewModelTest.swift
//  Arbres One PointTests
//
//  Created by Otourou Da Costa on 15/01/2022.
//

import XCTest
@testable import Arbres_One_Point

class ArbreListViewModelTest: XCTestCase {

    func testArbreListViewModel_WhenDataReturned() {

        let expectation = XCTestExpectation(description: "The response model is expected to be updated.")
        let dataService = MockDataService()
        dataService.expectation = expectation

        let viewModel = ArbreListViewModel(service: dataService)

        viewModel.getArbres()

        // Assert
        self.wait(for: [expectation], timeout: 5.0)
        XCTAssertNotNil(viewModel.arbreList, "Error when getting trees info.")
        XCTAssertEqual(viewModel.arbreList.value.count, 1)

    }
}
