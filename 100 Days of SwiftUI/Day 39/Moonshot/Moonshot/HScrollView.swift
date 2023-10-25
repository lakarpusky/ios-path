//
//  HScrollView.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/24/23.
//

import SwiftUI

struct HScrollView: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { member in
                    NavigationLink {
                        AstronautView(astronaut: member.astronaut)
                    } label: {
                        HStack {
                            Image(member.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Circle())
                            
                            RDividerView(width: 2)
                            
                            VStack(alignment: .leading) {
                                Text(member.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(member.role)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}
