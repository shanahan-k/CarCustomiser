//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Shanahan, Krystian (JD) on 16/01/2022.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresAndExhaustPackageOtherUpgradesDisabled() throws {
        //arrage
        let app = XCUIApplication()
        app.launch()
        //act
        let tablesQuery = app.tables
        tablesQuery.switches["exhaust package ($500)"].tap()
        tablesQuery.switches["Tires Package ($500)"].tap()
        //assert
        XCTAssertEqual(tablesQuery.switches["ECU & fuel package ($1000)"].isEnabled, false)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
