//
//  HidingAndGroupuingData.swift
//  AccessibilitySandbox
//
//  Created by ☕️ Gabo.montero on 4/5/24.
//

import SwiftUI

struct HidingAndGroupuingData: View {
    var body: some View {
        // .. tell a particular image is just there to make the UI look better
        // .. it doesn't actually convey any information and so
        // .. tells it should by ignored by (VoiceOver)
        Image(decorative: "character")
        
        // .. for all views you can get same result using the (accessibilityHidden) modifier
        // .. which makes any view completely invisible to the accessbilitity system:
        // .. you should only use this if the view in question really does add nothing
        Image(.alesKrivec15949)
            .accessibilityHidden(true)
        
        // .. the last way to hide content from (VoiceOver) is through grouping
        VStack {
            // .. (VoiceOver) sees that as two unrelated text views
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        // .. to combine children into a single accessibility element
        .accessibilityElement(children: .ignore) // .. so the child views are invisible to (VoiceOver)
        // .. then provide a custom label to the parent:
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    HidingAndGroupuingData()
}
