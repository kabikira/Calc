//
//  CalcTests.swift
//  CalcTests
//
//  Created by koala panda on 2024/06/11.
//

import XCTest
@testable import Calc

class CalculatorTests: XCTestCase {

    var clculator: Calculator!

    override func setUp() {
        super.setUp()
        self.clculator = Calculator()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAdd() {
        XCTAssertEqual(clculator.add(1, 2), 3)
    }

    func testSubtract() {
        XCTAssertEqual(clculator.subtract(3, 1), 2)
    }

    func testMultiple() {
        XCTAssertEqual(clculator.multiple(2, 3), 6)
    }

    func testDivision() {
        XCTAssertEqual(clculator.division(6, 2), 3)
    }
}

final class CalcTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}