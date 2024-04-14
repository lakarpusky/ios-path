//
//  LettingUsersSelectItemsList.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/14/24.
//

import SwiftUI

struct LettingUsersSelectItemsList: View {
    @State private var selection: String?
    @State private var multiSelection = Set<String>() // to upgrade this to handle multiple selection
    
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    var body: some View {
        // .. automatically handles enabling or disabling editing
        EditButton() // .. and therefore also enables or disables multi-select mode
        
        List(users, id: \.self, selection: $multiSelection) { user in
            Text(user)
        }
        
        if let selection {
            Text("You selected \(selection)")
        }
        
        if !multiSelection.isEmpty {
            Text("You selected \(multiSelection.formatted())")
        }
    }
}

#Preview {
    LettingUsersSelectItemsList()
}
