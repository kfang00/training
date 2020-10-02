//
//  ContentView.swift
//  HabitTracker
//
//  Created by Kayla Fang on 10/1/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

class Activity: Identifiable, Codable, ObservableObject {
    enum CodingKeys: CodingKey {
        case count
        case title
        case description
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(String.self, forKey: .count)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)


    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
    }
    let id = UUID()
    let title: String
    let description: String
    @Published var count: String {
        didSet {
//            do {
//                if let hold = try self.encode(to: JSONEncoder() as! Encoder) {
//                    print("success")
//                }
//            }
//            catch {
//                print("error")
//            }
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(count) {
                UserDefaults.standard.set(encoded, forKey: "count")
            }
        }
    }

    
    init(title: String, description: String, count: String) {
        self.title = title
        self.description = description
        self.count = count
//        if let count = UserDefaults.standard.data(forKey: "count") {
//            let decoder = JSONDecoder()
//
//            if let decoded = try? decoder.decode(String.self, from:count) {
//                self.count = decoded
//                return
//            }
//        }
    }
}

class Activities: ObservableObject {
    @Published var activitiesList = [Activity](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activitiesList) {
                UserDefaults.standard.set(encoded, forKey: "activitiesList")
            }
        }
    }
    
    init() {
        if let activitiesList = UserDefaults.standard.data(forKey: "activitiesList") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from:activitiesList) {
                self.activitiesList = decoded
                return
            }
        }
        self.activitiesList = []
    }
}

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddItem = false
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activitiesList) {item in
                    NavigationLink(destination: DetailView(activity: item)) {
                        HStack {
                            VStack (alignment: .leading){
                                Text(item.title)
                                    .font(.headline)
                                Text(item.description)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationBarTitle("HabitTracker")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddItem = true
                }) {
                    Text("Add New Activity")
                    
            })
        }
        .sheet(isPresented: $showingAddItem) {
            AddView(activities: self.activities)
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        activities.activitiesList.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
