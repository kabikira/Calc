//
//  GitHubRepository.swift
//  Calc
//
//  Created by koala panda on 2024/06/16.
//

import Foundation

struct GitHubRepository : Codable, Equatable {
    let id: Int
    let star: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case star = "stargazers_count"
        case name
    }
}
