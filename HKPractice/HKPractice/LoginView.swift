//
//  LoginView.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @Binding var screen: Int
    @Binding var index: Int
    @ObservedObject var userList: Users
    @State private var alertShowing = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Cart Manager!")
                    .font(.title)
                    .padding(.bottom, 20)
                Text("Enter your username")
                    .font(.headline)
                TextField("Username", text: $username)
                    .padding(.bottom, 20)
                Text("Enter your password")
                    .font(.headline)
                TextField("Password", text: $password)
                
                
                Button("Login") {
                    if !self.isLogicSuccessful() {
                        self.alertShowing.toggle()
                    }
                    else {
                        self.screen = 2
                    }
                }
                
//                List(userList.users) { user in
//                    Text("\(user.username)")
//                }
                
                Spacer()
            }
            .navigationBarTitle("HKPractice")
            .navigationBarItems(trailing: Button("Sign Up") {
                self.screen = 1
            })
            .padding(15)
                .alert(isPresented: $alertShowing) {
                    Alert(title: Text("Try Again"), message: Text("Invalid Username or Password"), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    func isLogicSuccessful() -> Bool {
        if let match = self.userList.users.firstIndex(where: {$0.username == self.username}) {
            if self.userList.users[match].password == self.password {
                self.index = match
                return true
            }
        }
        return false
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(screen: 1)
//    }
//}
