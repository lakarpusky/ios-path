//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by ☕️ Gabo.montero on 3/21/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
