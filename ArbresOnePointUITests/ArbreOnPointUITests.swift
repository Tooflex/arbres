//
//  ArbreOnPointUITests.swift
//  ArbresOnePointUITests
//
//  Created by Otourou Da Costa on 17/01/2022.
//

import XCTest

class ArbreOnPointUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testDetailiewInfoCorrect() throws {
        let name = app.tables.buttons.firstMatch.label
        app.tables.buttons.firstMatch.tap()

        // We wait 1 second
        sleep(1)

        XCTAssert(app.staticTexts["Name"].exists)
        XCTAssert(app.staticTexts["Specie"].exists)
        XCTAssert(app.staticTexts["Height"].exists)
        XCTAssert(app.staticTexts["Circumference"].exists)
        XCTAssert(app.staticTexts["Address"].exists)

        // Check if button label matches with name value in detail view
        if let substrRange = app.staticTexts["Name"].label
            .range(
                of: "(?<=:).*",
                options: .regularExpression) {
            XCTAssert(app.staticTexts["Name"].label[substrRange].trimmingCharacters(in: .whitespaces) == name)
        } else {
            XCTAssert(false)
        }
    }
}
