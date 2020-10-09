//
//  Prospect.swift
//  HotProspects
//
//  Created by Kayla Fang on 10/9/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false 
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    static let saveKey = "SavedData"


    init() {
        if let data = UserDefaults.standard.data(forKey: Prospects.self.saveKey) {
                if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                    self.people = decoded
                    return
                }
            }

            self.people = []
        }

    func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }

    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
}
