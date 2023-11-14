//
//  EditNavTitleVIew.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 11/14/23.
//

import SwiftUI

struct EditNavTitleVIew: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditNavTitleVIew()
}
