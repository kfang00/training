//
//  Picture.swift
//  PicChallenge
//
//  Created by Kayla Fang on 10/8/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import Foundation
import SwiftUI

struct Picture: Identifiable, Comparable {
    let id = UUID()
    let image: Image
    let name: String
    
    static func < (lhs: Picture, rhs: Picture) -> Bool {
        lhs.name < rhs.name
    }
}
