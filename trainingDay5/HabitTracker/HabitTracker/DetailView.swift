//
//  DetailView.swift
//  HabitTracker
//
//  Created by Kayla Fang on 10/2/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    //@State private var count = 0
    @ObservedObject var activity: Activity
    
    var body: some View {
        VStack (spacing: 10){
            Text("Description: \(activity.description)")
            Text("Completion Count: \(activity.count)")
            Button("Add to Completion Count") {
                var hold = Int(self.activity.count) ?? 0
                hold += 1
                self.activity.count = "\(hold)"
            }
            Spacer()
        }
        .navigationBarTitle(Text(activity.title))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activity: Activity(title: "Piano", description: "help", count: "0"))
    }
}
