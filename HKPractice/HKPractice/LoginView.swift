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
                    self.screen = 3
                }
                Spacer()
            }
            .navigationBarTitle("HKPractice")
            .navigationBarItems(trailing: Button("Sign Up") {
                self.screen = 2
            })
            .padding(15)
                //.onAppear(perform: loadData)
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(screen: 1)
//    }
//}
