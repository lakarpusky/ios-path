//
//  ContentView.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/20/24.
//

import SwiftUI

extension View {
    // .. to create an attractive card stack where each
    // .. card is a little further down the screen that the ones before it.
    func stacked(
        at position: Int, // .. takes a position in an array along with
        in total: Int // .. the total size of the array, and
    ) -> some View {
        // .. offsets a view by some amount based on those values
        let offset = Double(total - position)
        // .. push views down by 10 points for each place they are in the array
        return self.offset(y: offset * 10)
    }
}

struct ContentView: View {
    // .. to add a stack of 10 cards
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

#Preview {
    ContentView()
}
