//
//  AskToLeaveAppStoreReview.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/27/24.
//

import SwiftUI
import StoreKit // .1. step

struct AskToLeaveAppStoreReview: View {
    @Environment(\.requestReview) var requestReview // .2. step
    
    var body: some View {
        // .3. step
        Button("Leave a review") {
            // .. it's better to call (requestReview) automatically when you think it's the right time
            // .. when the user has performed an important task some number of times
            // .. that way it's clear they have realized the benefit of your app
            requestReview()
        }
    }
}

#Preview {
    AskToLeaveAppStoreReview()
}
