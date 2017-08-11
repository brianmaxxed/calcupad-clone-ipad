//
//  CalcupadUITests.swift
//  CalcupadUITests
//
//  Created by Will Kwon on 7/30/16.
//  Copyright © 2016 Will Kwon. All rights reserved.
//

import XCTest

class CalcupadUITests: XCTestCase {
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        app = XCUIApplication()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddition() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["="].tap()
        let resultLabelValue = app.staticTexts.element(matching: .any, identifier: "Results").label
        
        XCTAssertEqual(resultLabelValue, "9")
    }
    
    func testMultiply() {
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        let resultLabelValue = app.staticTexts.element(matching: .any, identifier: "Results").label
        
        XCTAssertEqual(resultLabelValue, "6")
    }
    
    func testContinuationOfEquationAfterSolution() {
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        app.buttons["×"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        let resultLabelValue = app.staticTexts.element(matching: .any, identifier: "Results").label
        
        XCTAssertEqual(resultLabelValue, "12")
    }
    
    func testContinuationOfEquationAfterSolutionWithRepeatNumber() {
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        app.buttons["="].tap()
        let resultLabelValue = app.staticTexts.element(matching: .any, identifier: "Results").label
        
        XCTAssertEqual(resultLabelValue, "18")
    }
    
    func testSolutionMultipliesItselfAfterSolution() {
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        app.buttons["×"].tap()
        app.buttons["="].tap()
        let resultLabelValue = app.staticTexts.element(matching: .any, identifier: "Results").label
        
        XCTAssertEqual(resultLabelValue, "36")
    }
    
    func testAdditionByItself() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["="].tap()
        let resultLabelValue = app.staticTexts.element(matching: .any, identifier: "Results").label
        
        XCTAssertEqual(resultLabelValue, "6")
    }
}
