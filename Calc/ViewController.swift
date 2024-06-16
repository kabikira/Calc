//
//  ViewController.swift
//  Calc
//
//  Created by koala panda on 2024/06/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var manager: GitHubRepositoryManager!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: Cell.className, bundle: nil), forCellReuseIdentifier: Cell.className)
        self.tableView.dataSource = self

        self.manager = GitHubRepositoryManager()
        self.manager.load(user: "apple") { [weak self] in
            print("Repositories loaded: \(self?.manager.majorRepoditories.count ?? 0)")  // デバッグプリント

            self?.tableView?.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.manager.majorRepoditories.count
        print("Number of rows: \(count)")  // デバッグプリント
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.className, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        let repository = self.manager.majorRepoditories[indexPath.row]
        cell.configure(gitHubRepository: repository)
        print("Configured cell for row \(indexPath.row)")  // デバッグプリント
        return cell
    }
}

