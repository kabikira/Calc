//
//  GitHubAPICllent.swift
//  Calc
//
//  Created by koala panda on 2024/06/16.
//

import Foundation

// 新たにプロトコルを作成
protocol GitHubAPIClientProtocol {
    func fetchRepositories(user: String, handler: @escaping ([GitHubRepository]?) -> Void)
}

class GitHubAPIClient: GitHubAPIClientProtocol {

    // ユーザ名を受け取り､そのユーザーのリポジトリ一覧を取得する｡
    func fetchRepositories(user: String, handler: @escaping ([GitHubRepository]?) -> Void) {

        let url = URL(string: "https://api.github.com/users/\(user)/repos")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                handler(nil)
                return
            }
            let repos = try! JSONDecoder().decode([GitHubRepository].self, from: data)
            DispatchQueue.main.async {
                handler(repos)
            }
        }
        task.resume()
    }
}
