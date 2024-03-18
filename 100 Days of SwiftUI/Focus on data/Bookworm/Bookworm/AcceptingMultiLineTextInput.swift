//
//  AcceptingMultiLineTextInput.swift
//  Bookworm
//
//  Created by ☕️ Gabo.montero on 3/17/24.
//

import SwiftUI

struct AcceptingMultiLineTextInput: View {
    // .. (@AppStorage) is not designed to store secure information,
    // .. so never use it for anything private
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextEditor(text: $notes)
                    .padding()
                
                TextField("Enter your text", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .navigationTitle("Notes")
        }
    }
}

#Preview {
    AcceptingMultiLineTextInput()
}
