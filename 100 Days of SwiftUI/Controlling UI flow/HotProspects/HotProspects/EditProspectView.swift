//
//  EditProspectView.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/20/24.
//

import SwiftUI
import SwiftData

struct EditProspectView: View {
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
                .textContentType(.name)
            
            TextField("Email Address", text: $prospect.emailAddress)
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
        }
        .navigationTitle("Edit Prospect")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Prospect.self, configurations: config)
        let prospect = Prospect(
            name: "Gabo.montero",
            emailAddress: "lakarpusky@gmail.com",
            isContacted: false
        )
        
        return NavigationStack {
            EditProspectView(prospect: prospect)
                .modelContainer(container)
        }
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
