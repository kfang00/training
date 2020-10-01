//
//  AstronautView.swift
//  Moonshot
//
//  Created by Kayla Fang on 9/30/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions : [Mission]
    
    var body: some View {
        GeometryReader {geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Missions Flew On")
                        .font(.headline)
                    
                    List(self.missions) {mission in
                        Text("Apollo \(mission.id)")
                        
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        var matches = [Mission]()
        
        for mission in missions {
            if mission.crew.contains(where: {$0.name == astronaut.id}) {
                matches.append(mission)
            }
        }
        self.missions = matches
        
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
