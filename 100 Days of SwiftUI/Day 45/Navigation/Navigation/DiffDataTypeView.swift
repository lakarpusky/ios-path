//
//  DiffDataTypeView.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 11/12/23.
//

import SwiftUI

struct DiffDataTypeView: View {
    // .. "NavigationStack": is what we call `type-eraser` it stores any kind of "Hashable" data without
    // .. exposing exaclty what type of data each items is
    @State private var path = NavigationPath() // .. able to hold a variety of data types in a single path
    
    var body: some View {
        // .. bind to the stack
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
            // .. then push things to it programmatically
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
        }
    }
}

#Preview {
    DiffDataTypeView()
}
