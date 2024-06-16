//
//  GitHubRepositoryManagerTests.swift
//  Calc
//
//  Created by koala panda on 2024/06/17.
//

import Foundation

class MockGitHubAPIClient: GitHubAPIClientProtocol {

    var returnRepositories: [GitHubRepository] // 返却するリポジトリ一覧を保持
    var argsUser: String?

    // コンストラクタでテスト用のデータを受け取る
    init(repositories: [GitHubRepository]) {
        self.returnRepositories = repositories
    }

    // 引数を記録
    func fetchRepositories(user: String, handler: @escaping ([GitHubRepository]?) -> Void) {
        self.argsUser = user
        handler(self.returnRepositories)
    }
}
