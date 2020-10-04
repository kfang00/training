//
//  ContentView.swift
//  challengeCore
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink (destination: DetailView(user: user)){
                    VStack (alignment: .leading){
                        Text(user.name)
                            .font(.headline)
                        Text("Age: \(user.age)")
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Users")
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedUsers
                    }

                    return
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")

        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
