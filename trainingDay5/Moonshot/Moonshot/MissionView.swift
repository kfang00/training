//
//  MissionView.swift
//  Moonshot
//
//  Created by Kayla Fang on 9/30/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    Text(self.mission.formattedLaunchDate)
                        .padding()
                        .font(.headline)
                    
                    Text(self.mission.description)
                        .padding()
                     
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink (destination: AstronautView(astronaut: crewMember.astronaut, missions: self.missions)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 91, height: 69)
                                    .clipShape(Capsule())
                                    .overlay(Capsule()
                                    .stroke(Color.primary, lineWidth: 1))
                                
                                VStack (alignment: .leading){
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    
                                    Text(crewMember.role)
                                        .foregroundColor(crewMember.role == "Commander" ? Color.blue : .secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
        
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
