//
//  DetailView.swift
//  ChallengeJSON
//
//  Created by Kayla Fang on 10/3/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let user: User
    var body: some View {
        ScrollView(.vertical) {
            VStack (alignment: .leading, spacing: 6) {
                Section {
                    Text("Age: \(user.age)")
                    Text("Company: \(user.company)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    Text("About: \(user.about)")
                }
                .padding(5)
                
                Text("Friends")
                    .font(.headline)
                List {
                    ForEach(user.friends) {friend in
                        NavigationLink (destination: FriendView(friend: friend)) {
                            Text(friend.name)
                        }
                    }
                }
                
                
            }
            .navigationBarTitle(Text(user.name))
            .padding(10)
            .frame(maxHeight: .infinity)
            
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static let user: User
//    static var previews: some View {
//        DetailView(user: user)
//    }
//    //<#Decoder#>, id: "2525", isActive: true, name: "String", about: String, registered: String, tags: [String], friends: [Friend]
//}
