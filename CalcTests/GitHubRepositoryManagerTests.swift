//
//  GitHubRepositoryMnagerTests.swift
//  CalcTests
//
//  Created by koala panda on 2024/06/17.
//

import XCTest
@testable import Calc


final class GitHubRepositoryManagerTests: XCTestCase {

    func testMajorRepositories() {

        // テスト用のリポジトリ一覧
        let testRepositories: [GitHubRepository] = [
            GitHubRepository(id: 0, star: 9, name: ""),
            GitHubRepository(id: 1, star: 10, name: ""),
            GitHubRepository(id: 2, star: 11, name: ""),
        ]

        // モックを生成
        let mockClient = MockGitHubAPIClient(repositories: testRepositories)

        // テスト対象を生成する際にモックを渡す
        let manager = GitHubRepositoryManager(client: mockClient)

        // テスト対象のメソッドを呼び出し
        manager.load(user: "apple") {

            // 引数の検証
            XCTAssertEqual(mockClient.argsUser, "apple")

            // 結果の検証
            XCTAssertEqual(manager.majorRepoditories.count, 2)
            XCTAssertEqual(manager.majorRepoditories[0].id, 1)
            XCTAssertEqual(manager.majorRepoditories[1].id, 2)
        }
    }

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
