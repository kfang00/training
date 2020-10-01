//
//  ContentView.swift
//  Moonshot
//
//  Created by Kayla Fang on 9/30/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var isLaunchDateShow = true
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        //.aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.isLaunchDateShow {
                            Text(mission.formattedLaunchDate)
                        } else {
                            HStack {
                                ForEach(mission.crew, id: \.name) {
                                    Text($0.name.prefix(1).uppercased() + $0.name.dropFirst() )
                                }
                            }
                        }
                        
                    }
                    
                }
            }
        .navigationBarTitle("Moonshot")
        .navigationBarItems(trailing:
            Button(action: {
                self.isLaunchDateShow.toggle()
            }) {
                Text(isLaunchDateShow ? "Display Crew" : "Show Launch Date")
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
