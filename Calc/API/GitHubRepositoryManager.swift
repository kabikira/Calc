//
//  GitHubRepositoryManager.swift
//  Calc
//
//  Created by koala panda on 2024/06/16.
//

import Foundation

class GitHubRepositoryManager {

    private let client: GitHubAPIClientProtocol
    private var repos: [GitHubRepository]?

    // スター数が10以上のリポジトリを返す(未取得の場合は空)
    var majorRepoditories: [GitHubRepository] {
        guard let repositories = self.repos else { return [] }
        return repositories.filter { $0.star >= 10 }
    }

    init(client: GitHubAPIClientProtocol) {
        self.client = client
    }

    // 指定されたユーザ名のリポジトリ一覧を読み込み､
    // 完了したらコールバックを読み出す｡
    func load(user: String, completion: @escaping () -> Void) {
        self.client.fetchRepositories(user: user) { (repositories) in
            self.repos = repositories
            completion()
        }
    }
}
