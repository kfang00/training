//
//  User.swift
//  ChallengeJSON
//
//  Created by Kayla Fang on 10/3/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}
