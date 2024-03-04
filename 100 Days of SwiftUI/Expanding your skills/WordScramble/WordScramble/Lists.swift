//
//  Lists.swift
//  WordScramble
//
//  Created by ☕️ Gabo.montero on 3/3/24.
//

import SwiftUI

struct Lists: View {
    let people = ["finn", "leia", "luke", "rey"]
    
    var body: some View {
        List {
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            
            Section {
                // .. create rows dynamically
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }
        }
        .listStyle(.grouped)
        
        // .. if your entire list is made up of dynamic rows
        List(people, id: \.self) {
            Text("Hello, \($0)!")
        }
        
        List {
            Text("Static row")
            ForEach(people, id: \.self) {
                Text($0)
            }
            Text("Static row")
        }
    }
}

#Preview {
    Lists()
}
