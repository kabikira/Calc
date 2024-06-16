//
//  Cell.swift
//  Calc
//
//  Created by koala panda on 2024/06/17.
//

import Foundation
import UIKit

class Cell: UITableViewCell {
    static var className: String { String(describing: Cell.self) }


    @IBOutlet weak var label: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    func configure(gitHubRepository: GitHubRepository) {
        self.label.text = gitHubRepository.name
    }
}
