//
//  BookwormApp.swift
//  Bookworm
//
//  Created by ☕️ Gabo.montero on 3/17/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // step 2. Makes SwiftData available everywhere in our app
        .modelContainer(for: Book.self) // .. SwiftData's name for where it stores its data
        // .. the first time the app runs this means SwiftData has to create the underlying database file,
        // .. but in future runs it will load the database it made previously
        
        // .. step 3. Create the (model context), the "live" version of your data
        
        // .. when you load objects and change them,
        // .. those changes only exist in memory until they are saved
        
        // .. (model context): let us work with all our data in memory,
        // .. faster than constantly reading and writing data to disk
        
        // .. every SwiftDat app needs a (model context) to work with,
        // .. - it's created automatically when we use (modelContiner) momdifier
        
        // .. SwiftData automatically creates one model context for us,
        // .. called (main context), and stores it in SwiftUI's environment
    }
}
