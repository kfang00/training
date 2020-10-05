//
//  User.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import Foundation

class User: ObservableObject, Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case username, password, cart
    }
    
    @Published var id = UUID()
    @Published var username = ""
    @Published var password = ""
    @Published var cart = Cart()
    
    init(username: String, password: String, cart: Cart) {
        self.username = username
        self.password = password
        self.cart = cart
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
        cart = try container.decode(Cart.self, forKey: .cart)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(cart, forKey: .cart)


    }
}
