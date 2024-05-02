//
//  SharingObservableObjects.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/2/24.
//

import SwiftUI

@Observable
class Player {
    var name = "None"
    var score = 0
}

struct ScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        Text("Your high score: \(player.score)")
    }
}

struct SharingObservableObjects: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            ScoreView()
        }
        .environment(player) // .. for classes that use the (@Observable) macro
    }
}

#Preview {
    SharingObservableObjects()
}
