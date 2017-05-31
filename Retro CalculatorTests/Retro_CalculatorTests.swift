//
//  Retro_CalculatorTests.swift
//  Retro CalculatorTests
//
//  Created by Andrew Foster on 5/31/17.
//  Copyright © 2017 Foster Inc. All rights reserved.
//

import XCTest

class Retro_CalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAudio() {
    
        XCTAssertNotNil(AudioService.instance)
        XCTAssertNotNil(AudioService.instance.pathForResource(fileName: "btn", fileType: "wav"))
        XCTAssertNotNil(AudioService.instance.btnUrl)
        XCTAssertNotNil(AudioService.instance.createPlayerWithUrl(audioUrl: AudioService.instance.btnUrl!))
        
        XCTAssertFalse(AudioService.instance.playCurrentSoundFX())
        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(audioUrl: AudioService.instance.btnUrl!)
        XCTAssertNotNil(AudioService.instance.soundFXPlayer)
        XCTAssertTrue(AudioService.instance.playCurrentSoundFX())
        
    }
    
    func testCalcService() {
        
        XCTAssertNotNil(CalcService.instance)
        XCTAssertEqual(CalcService.Operation.add.rawValue, "+", "Incorrect Operator")
        XCTAssertEqual(CalcService.Operation.subtract.rawValue, "-", "Incorrect Operator")
        XCTAssertEqual(CalcService.Operation.multiply.rawValue, "*", "Incorrect Operator")
        XCTAssertEqual(CalcService.Operation.empty.rawValue, "Empty")
        
        XCTAssertNil(CalcService.instance.multiply(numAstr: "a", numBstr: "f4"))
        XCTAssertNotNil(CalcService.instance.multiply(numAstr: "4.0", numBstr: "7.0"))
        XCTAssertEqual(CalcService.instance.multiply(numAstr: "10.0", numBstr: "5.0"), "50.0")
        
        XCTAssertNil(CalcService.instance.divide(numAstr: "a", numBstr: "b"))
        XCTAssertNotNil(CalcService.instance.divide(numAstr: "10.0", numBstr: "5.0"))
        XCTAssertEqual(CalcService.instance.divide(numAstr: "10.0", numBstr: "5.0"), "2.0")
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
