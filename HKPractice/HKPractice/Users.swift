//
//  Users.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import Foundation

class Users: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case users
    }
    
    @Published var users = [User]()
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        users = try container.decode([User].self, forKey: .users)

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(users, forKey: .users)
    }
}
