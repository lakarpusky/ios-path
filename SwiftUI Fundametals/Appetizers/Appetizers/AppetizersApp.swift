//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    let order = Order()
    
    var body: some Scene {
        WindowGroup {
            // .. injecting the "order" as an environment object
            // .. so all children of the tab view has global access to it
            AppetizerTabView().environmentObject(order)
        }
    }
}
