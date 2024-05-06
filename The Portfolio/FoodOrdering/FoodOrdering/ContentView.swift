//
//  ContentView.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .toolbar(.hidden)
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ContentView()
}