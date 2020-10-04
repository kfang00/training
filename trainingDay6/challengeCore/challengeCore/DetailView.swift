//
//  DetailView.swift
//  challengeCore
//
//  Created by Kayla Fang on 10/4/20.
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

                Section {
                    Text("Friends")
                        .font(.headline)
                    
                    ForEach(user.friends) {friend in
                            NavigationLink (destination: FriendView(friend: friend)) {
                                Text(friend.name)
                                    .padding()
                                    .frame(alignment: .leading)
                                    
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
//    static var previews: some View {
//        DetailView()
//    }
//}
