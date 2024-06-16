//
//  ViewController.swift
//  Calc
//
//  Created by koala panda on 2024/06/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var manager: GitHubRepositoryManager!

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(UINib.init(nibName: Cell.className, bundle: nil), forCellReuseIdentifier: Cell.className)
            self.tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = GitHubRepositoryManager()
        self.manager.load(user: "apple") { [weak self] in
            self?.tableView?.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.manager.majorRepoditories.count
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.className, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        let repository = self.manager.majorRepoditories[indexPath.row]
        cell.configure(gitHubRepository: repository)
        return cell
    }
}

