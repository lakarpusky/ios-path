//
//  ContentView.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var griditemSize: CGFloat? = 150
    @State var gridView = true
    
    func toggleView() {
        griditemSize = !gridView ? 150 : .infinity
        gridView.toggle()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: griditemSize!))
                ]) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            if gridView {
                                GridItemView(mission: mission)
                            } else {
                                ListItemView(mission: mission)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                HStack {
                    Button(action: toggleView) {
                        Image(systemName: "square.grid.2x2")
                    }
                    .disabled(gridView)
                    
                    Button(action: toggleView) {
                        Image(systemName: "list.bullet")
                    }
                    .disabled(!gridView)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
