//
//  AddView.swift
//  HabitTracker
//
//  Created by Kayla Fang on 10/1/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var activityTitle = ""
    @State private var description = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Type of Activity", text: $activityTitle)
                TextField("Activity Description", text: $description)
            }
            .navigationBarTitle("Adding new activity")
            .navigationBarItems(trailing:
                Button("Save") {
                    self.activities.activitiesList.append(Activity(title: self.activityTitle, description: self.description, count: "0"))
                    self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
