//
//  TwoSideBySideViews.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/1/24.
//

import SwiftUI

struct TwoSideBySideViews: View {
    var body: some View {
        NavigationSplitView(
            columnVisibility: .constant(.all),
            // .. helpful on iPhone where the primary view is seletec as standard
            preferredCompactColumn: .constant(.detail) // .. to prefer the detail view by default
        ) {
            // .. it will automatically load its content in the second view
            NavigationLink("Primary") {
                Text("Primary")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        // .. tell iOS to prefer to keep the primary view around when space is partically limited
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    TwoSideBySideViews()
}
