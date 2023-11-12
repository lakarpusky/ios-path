//
//  ProgrammaticNavigationView.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 11/12/23.
//

import SwiftUI

struct ProgrammaticNavView: View {
    @State private var path = [Int]()
    
    var body: some View {
        //..changing the array wil automatically navigate to whatever is in the array
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavView()
}
