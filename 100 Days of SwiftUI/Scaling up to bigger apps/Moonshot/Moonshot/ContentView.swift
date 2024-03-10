//
//  ContentView.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showGridView = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showGridView {
                    GridLayout(
                        missions: missions,
                        astronauts: astronauts
                    )
                } else {
                    ListLayout(
                        missions: missions,
                        astronauts: astronauts
                    )
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(
                    "View",
                    systemImage: showGridView ? "list.bullet" : "square.grid.2x2"
                ) {
                    showGridView.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
