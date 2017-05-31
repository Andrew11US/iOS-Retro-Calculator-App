//
//  Retro_CalculatorUITests.swift
//  Retro CalculatorUITests
//
//  Created by Andrew Foster on 5/31/17.
//  Copyright © 2017 Foster Inc. All rights reserved.
//

import XCTest

class Retro_CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalc() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .faceUp
        
        let app = XCUIApplication()
        
        let button = app.buttons["5"]
        
        button.tap()
        app.buttons["add"].tap()
        button.tap()
        
        let equalButton = app.buttons["equal"]
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["10.0"].exists)
        
        app.buttons["subtract"].tap()
        button.tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["5.0"].exists)
        
        app.buttons["multiply"].tap()
        button.tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["25.0"].exists)
        
        app.buttons["divide"].tap()
        button.tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["5.0"].exists)
        
        app.buttons["clear"].tap()
        
        XCTAssertTrue(app.staticTexts["0"].exists)
        
    }
    
}
