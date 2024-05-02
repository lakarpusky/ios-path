//
//  OptionalsAlertAndSheet.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/1/24.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct OptionalsAlertAndSheet: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me: Sheet") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
            // .. to make the sheet take up less than the full screen space
                .presentationDetents(
                    [
                        .medium, // .. the initial size will be used when the sheet is first shown
                        .large // .. iOS will show a little grab handle that lets users pull the sheet up to full size
                    ]
                )
        }
        
        Button("Tap Me: Alert") {
            isShowingUser = true
        }
        .alert(
            "Welcome",
            isPresented: $isShowingUser,
            presenting: selectedUser
        ) { user in
            Button(user.id) { }
        }
    }
}

#Preview {
    OptionalsAlertAndSheet()
}
