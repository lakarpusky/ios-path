//
//  FoodOrderingApp.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/4/24.
//

import SwiftUI
import Firebase

@main
struct FoodOrderingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// .. initializing Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
