//
//  CVUITests.swift
//  CVUITests
//
//  Created by Bazyl Reinstein on 2/3/20.
//  Copyright © 2020 Bazyl Reinstein. All rights reserved.
//

import XCTest

class CVUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Jonathan"]/*[[".cells.staticTexts[\"Jonathan\"]",".staticTexts[\"Jonathan\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        
    }
}
