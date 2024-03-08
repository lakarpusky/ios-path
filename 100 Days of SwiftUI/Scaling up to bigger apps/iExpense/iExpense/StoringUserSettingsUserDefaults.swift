//
//  StoringUserSettingsUserDefaults.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

struct StoringUserSettingsUserDefaults: View {
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            //UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    StoringUserSettingsUserDefaults()
}
