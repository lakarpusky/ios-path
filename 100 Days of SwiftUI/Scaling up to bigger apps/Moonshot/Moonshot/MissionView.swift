//
//  MissionView.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 3/9/24.
//

import SwiftUI

struct HDivider: View {
    let height: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                    .accessibilityLabel("\(mission.image) mission")
                
                Text(mission.formattedMissionLaunchDate)
                    .foregroundStyle(.white.opacity(0.7))
                    .padding(.top)
                    .accessibilityLabel("Mission launch date \(mission.formattedMissionLaunchDate)")
                
                VStack(alignment: .leading) {
                    HDivider(height: 2)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    HStack {
                        HDivider(height: 2)
                        Text("Crew Members")
                            .font(.title3.bold())
                            .padding(.bottom, 5)
                            .frame(width: 150)
                        HDivider(height: 2)
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
                .accessibilityElement()
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Mission highlights")
                .accessibilityValue(mission.description)
            }
            .padding(.bottom)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack(alignment: .bottom) {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(.white, lineWidth: 1)
                                    }
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundStyle(.white)
                                        .font(.headline)
                                    
                                    Text(crewMember.role)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            
            fatalError("Missing \(member.name)")
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
