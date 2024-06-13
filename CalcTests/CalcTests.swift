//
//  CalcTests.swift
//  CalcTests
//
//  Created by koala panda on 2024/06/11.
//

import XCTest
@testable import Calc

// 非同期のテスト
class EchoTest: XCTestCase {
    // 間違ったテスト これでも失敗にならない
//    func testEcho() {
//        echo(message: "Hello") { (message) in
//            XCTFail()
//        }
//    }
    // 正しいテストコード
    func testEcho() {

        // 待機用
        let exp: XCTestExpectation = expectation(description: "wait for finish")

        echo(message: "Hello") { (messge) in
            XCTAssertEqual(messge, "Hello!")
//            XCTFail()

            // expの待機を解除
            exp.fulfill()
        }

        // expに対してfullfill()が呼び出されるまで待機(5秒でタイムアウト)
        // 非同期のechoメソッドの完了を確認するため5秒待機
        wait(for: [exp], timeout: 5)
    }
}

// テスト階層化
class SafeDivisionTest: XCTestCase {
    func testSafeDivisionRunActivityNest() {

        XCTContext.runActivity(named: "通常の割り算") { _ in
            XCTAssertEqual(safeDivision(6, 3), 2)
            XCTAssertEqual(safeDivision(6, 2), 3)
        }

        XCTContext.runActivity(named: "0除算") { _ in
            XCTAssertNil(safeDivision(6,0))
        }
        
        // ネストできる
        XCTContext.runActivity(named: "通常の割り算") { _ in
            XCTContext.runActivity(named: "6 / 3 = 2") { _ in
                XCTAssertEqual(safeDivision(6, 3), 2)
            }
        }
    }
}


// 独自のアサーション
//func assertEmpty(_ string: String) {
//    XCTAssertTrue(string.isEmpty, "\(string)\" is not empty")
//}
func assertEmpty(_ string: String,
                 file: StaticString = #file,
                 line: UInt = #line) {
    XCTAssertTrue(string.isEmpty, "\"\(string)\" is not empty", file: file, line: line)
}

class OriginalAssertionTests: XCTestCase {

    func testAsserEmpty() {
        let string = "hello"
        assertEmpty(string)
    }
}

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

        // Boolを判定
        let string = "Hello"
        XCTAssertTrue(string.hasPrefix("He"))
        XCTAssertFalse(string.isEmpty)

        // nilを判定
        let notNumber = Int("Hello")
        XCTAssertNil(notNumber)

        let number = Int("42")
        XCTAssertNotNil(number)

        // 等値性を判定する
        let string2 = "Hello"

        XCTAssertEqual(string, "Hello")
        XCTAssertNotEqual(string, "Goodbye")

        // Equtableに準拠していないと比較できない


        let dog1 = Dog(name: "ポチ", age: 3)
        let dog2 = Dog(name: "ジョン", age: 4)

        XCTAssertNotEqual(dog1, dog2)

        let cat1 = Cat()
        let cat2 = cat1
        XCTAssertTrue(cat1 === cat2)

        let cat3 = Cat()
        XCTAssertTrue(cat1 !== cat3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
