//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/14/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
