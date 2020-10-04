//
//  Item.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import Foundation

struct Item: Codable, Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
}
