//
//  SwitchingViewStatesWithEnums.swift
//  BucketList
//
//  Created by ☕️ Gabo.montero on 3/30/24.
//

import SwiftUI

// .1. step: an enum for the varios view states you want to represent
enum LoadingState {
    case loading, success, failed
}

// .2. step: create individual views for those states
struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct SwitchingViewStatesWithEnums: View {
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

#Preview {
    SwitchingViewStatesWithEnums()
}
