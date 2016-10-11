//
//  tabBarTests.swift
//  tabBarTests
//
//  Created by ANGELIE RAMDIAL on 9/27/16.
//  Copyright © 2016 ANGELIE RAMDIAL. All rights reserved.
//

import XCTest
@testable import tabBar

class tabBarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testSequenceOne() {
        let myCalcModel = CalculatorModel()
        myCalcModel.numberPressed(5)
        XCTAssert(myCalcModel.getDisplay() == "5")
        
        myCalcModel.numberPressed(2)
        XCTAssert(myCalcModel.getDisplay() == "52")
        
        myCalcModel.operationPressed(.Plus)
        XCTAssert(myCalcModel.getDisplay() == "52.0")
        
        myCalcModel.numberPressed(3)
        XCTAssert(myCalcModel.getDisplay() == "3")
        
        myCalcModel.operationPressed(.Minus)
        XCTAssert(myCalcModel.getDisplay() == "55.0")
        
        myCalcModel.numberPressed(7)
        XCTAssert(myCalcModel.getDisplay() == "7")
        
        myCalcModel.operationPressed(.Equals)
        XCTAssert(myCalcModel.getDisplay() == "48.0")
        
        myCalcModel.numberPressed(6)
        XCTAssert(myCalcModel.getDisplay() == "6")
        
        myCalcModel.operationPressed(.Multiply)
        XCTAssert(myCalcModel.getDisplay() == "6.0")
        
        myCalcModel.numberPressed(4)
        XCTAssert(myCalcModel.getDisplay() == "4")
        
        myCalcModel.operationPressed(.Equals)
        XCTAssert(myCalcModel.getDisplay() == "24.0")
        
        myCalcModel.operationPressed(.Divide)
        myCalcModel.numberPressed(12)
        
        myCalcModel.operationPressed(.Equals)
        XCTAssert(myCalcModel.getDisplay() == "2.0")
        
        
    }

    func testSequenceTwo() {
        let myCalcModel = CalculatorModel()
        myCalcModel.numberPressed(5)
        XCTAssert(myCalcModel.getDisplay() == "5")
        
        myCalcModel.numberPressed(0)
        XCTAssert(myCalcModel.getDisplay() == "50")
        
        myCalcModel.operationPressed(.Equals)
        XCTAssert(myCalcModel.getDisplay() == "50.0")
        
        myCalcModel.numberPressed(10)
        XCTAssert(myCalcModel.getDisplay() == "10")
        
        
        myCalcModel.operationPressed(.Divide)
        XCTAssert(myCalcModel.getDisplay() == "10.0")
        
        myCalcModel.numberPressed(0)
        XCTAssert(myCalcModel.getDisplay() == "0")
        myCalcModel.operationPressed(.Equals)
        XCTAssert(myCalcModel.getDisplay() == "ERROR")
        
        myCalcModel.numberPressed(2)
        XCTAssert(myCalcModel.getDisplay() == "2")
        
        myCalcModel.operationPressed(.Multiply)
        myCalcModel.numberPressed(0)
        XCTAssert(myCalcModel.getDisplay() == "0")
        
        myCalcModel.operationPressed(.Equals)
        XCTAssert(myCalcModel.getDisplay() == "0.0")
        
       
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let myCalcModel = CalculatorModel()
            for _ in 0...100 {
                myCalcModel.numberPressed(5)
                myCalcModel.numberPressed(2)
                myCalcModel.operationPressed(.Plus)
                myCalcModel.numberPressed(3)
                myCalcModel.operationPressed(.Minus)
                myCalcModel.numberPressed(7)
                myCalcModel.operationPressed(.Equals)
                myCalcModel.operationPressed(.Divide)
                myCalcModel.numberPressed(3)
                myCalcModel.operationPressed(.Equals)
                myCalcModel.operationPressed(.Multiply)
                myCalcModel.numberPressed(2)
                myCalcModel.operationPressed(.Equals)
                myCalcModel.operationPressed(.Divide)
                myCalcModel.numberPressed(0)
                myCalcModel.operationPressed(.Equals)
    
            }
        }
    }
    
}
