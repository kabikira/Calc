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

//外部環境に依存したテスト
//func isHoliday() -> Bool {
//
//    // 現在時刻の取得
//    let now = Date()
//
//    // 何番目の曜日か取得
//    let calendar = Calendar.current
//    let weekday = calendar.component(.weekday, from: now)
//
//    // 日曜または土曜であれば true
//    return weekday == 1 || weekday == 7
//}

// デフォルト引数を活用
func isHoliday(_ date: Date = Date()) -> Bool {

    // 何番目の曜日か取得
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: date)

    // 日曜または土曜であれば true
    return weekday == 1 || weekday == 7
}

// 現在時刻を取得するインターフェースとしてProtocolを定義
protocol DateProtocol {
    func now() -> Date
}

// 実際にリリースするアプリで利用する｢本物｣のクラスを実装
class DateDefault: DateProtocol {
    func now() -> Date {
        return Date()
    }
}

// isHoliday()メソッドが定義されたクラスを定義
class CalendarUtil {

    // 内部でDateProtocolへの依存を持つ
    let dateProtocl: DateProtocol

    // 補機数でDateProtocolを受け取れるように(デフォルトではDateDefaultを利用)
    init(dateProtocl: DateProtocol = DateDefault()) {
        self.dateProtocl = dateProtocl
    }

    // これまでと同じ仕様を持つisHoliday()メソッド
    func isHoliday() -> Bool {

        // DateProtocolを経由して現在の時刻を取得
        let now = dateProtocl.now()

        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: now)

        return weekday == 1 || weekday == 7
    }
}
