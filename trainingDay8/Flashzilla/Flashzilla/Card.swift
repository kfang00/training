//
//  Card.swift
//  Flashzilla
//
//  Created by Kayla Fang on 10/10/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
