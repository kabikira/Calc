//
//  Calculator.swift
//  Calc
//
//  Created by koala panda on 2024/06/11.
//

import Foundation

class Calculator {

    // 足し算
    func add(_ x: Int, _ y: Int) -> Int {
        return x + y
    }

    // 引き算
    func subtract(_ x: Int, _ y: Int) -> Int {
        return x - y
    }

    // 掛け算
    func multiple(_ x: Int, _ y: Int) -> Int {
        return x * y
    }
    
    // 割り算
    func division(_ x: Int, _ y: Int) -> Int {
        return x / y
    }

}

// Equtableに準拠していないと比較できない
struct Dog {
    var name: String
    var age: Int
}
// Global function 'XCTAssertNotEqual(_:_:_:file:line:)' requires that 'Dog' conform to 'Equatable'を解決する
extension Dog: Equatable{}

// オブジェクトの参照が等しいことうぃ検証する
class Cat {}


// テスト階層化
func safeDivision(_ x: Int, _ y: Int) -> Int? {
    if y == 0 {
        return nil
    } else {
        return x / y
    }
}

// 非同期なAPIのテスト
func echo(message: String, _ handler: @escaping (String) -> Void) {
    DispatchQueue.global().async {

        // 3秒間待機
        Thread.sleep(forTimeInterval: 3)

        // 末尾に｢!｣をつけてコールバックで呼び出し
        DispatchQueue.main.async {
            handler("\(message)!")
        }
    }
}
