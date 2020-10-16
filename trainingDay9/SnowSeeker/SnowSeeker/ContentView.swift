//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Kayla Fang on 10/14/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @ObservedObject var favorites = Favorites()

    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )

                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }.layoutPriority(1)
                    if self.favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                        .accessibility(label: Text("This is a favorite resort"))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            WelcomeView()
        }
        //.phoneOnlyStackNavigationView()
        .environmentObject(favorites)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
