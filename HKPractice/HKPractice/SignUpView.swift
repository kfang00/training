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
    @ObservedObject var userList: Users
    @Binding var screen : Int
    
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
                
//                NavigationLink(destination: LoginView(screen: self.$screen, userList: self.userList)) {
//                    Text("sing uaodf")
//                }
                
                Button("Sign Up") {
                    self.screen = 0
                    let user = User(username: self.username, password: self.password, cart: Cart())
                    self.userList.users.append(user)
                    self.postData()
                }
//testing whether the userlist updated
//                List(userList.users) { user in
//                    Text("\(user.username)")
//                }
                Spacer()
            }
            .navigationBarTitle("HKPractice")
            .padding(15)
        }
    }
    
    func postData() {
        guard let encoded = try? JSONEncoder().encode(userList) else {
            print("Fail to encode order")
            return
        }
        guard let url = URL(string: "https://hkp-ios-demo-api.herokuapp.com/") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedUsers = try? JSONDecoder().decode(Users.self, from: data) {
                    DispatchQueue.main.async {
                        self.userList.users = decodedUsers.users
                    }

                    return
                }
            }
            
            print("Invalid response from server")

        }.resume()
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
