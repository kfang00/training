//
//  SignUpView.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    //@State var users: [User]
    
    var body: some View {
       NavigationView {
            VStack {
                Text("Create a new account!")
                    .font(.title)
                    .padding(.bottom, 20)
                Text("Choose your username")
                    .font(.headline)
                TextField("Username", text: $username)
                    .padding(.bottom, 20)
                Text("Choose your password")
                    .font(.headline)
                TextField("Password", text: $password)
                
                Button(action: {
                    let user = User(username: self.username, password: self.password, cart: [Item]())
                    //self.users.append(user)
                    print("hey")
                }) {
                    NavigationLink(destination: AddItemView()) {
                        Text("Sign Up")
                    }
                }

                
                Spacer()
            }
            .navigationBarTitle("HKPractice")
            .padding(15)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
