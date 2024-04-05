//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by ☕️ Gabo.montero on 4/4/24.
//

import Foundation
import MapKit
// .7.b. step
import LocalAuthentication // .. to have access to Apple's authentication framework

// .. to create a new class that manages our data,
// .. and manipulates it on behalf of the (ContentView)
// .. so that our view doesn't reallly care how the underlying data systems works.

// .2. step
// to palce that new class inside an extension on (ContentView)
extension ContentView {
    // .1. step
    // create a new class that uses the (Observable) macro,
    // so we're able to report changes back to any view that's watching:
    @Observable
    class ViewModel {
        // .3. step
        // move both (State) properties in (ContentView) over to its view model,
        // removing the (State private) parts because they aren't needed any more:
        private(set) var locations: [Location] // .. reading locations is fine, but only the class itself can write locations
        var selectedPlace: Location?
        
        // .6. step
        // to add a new property to store the location we're saving to:
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        // .7. step
        // to require the user to authenticate themselves using either Touch ID or Face ID
        // in order to see all the palces they have marked on the app.
        var isUnlocked = false
        // .7.a. step
        // add the Face ID permission request key to our project configuration options,
        // explaining the user why we want to use Face ID.
        
        
        var alertTitle = ""
        var alertMessage = ""
        var showingAlert = false
        
        // .6.a. step
        // a new initializer and...
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        // .5. step
        // adding a new location, and updating an existing one
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(
                id: UUID(),
                name: "New location",
                description: "",
                latitude: point.latitude,
                longitude: point.longitude
            )
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        // .6.b. step
        // ... a new (save) method that makes sure our data is saved automatically
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                alertTitle = "Save Data Error"
                alertMessage = "Unable to save data: \(error.localizedDescription)"
                showingAlert = true
            }
        }
        
        // .7.c. step
        // to handle all the biometric work:
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places"
                
                context.evaluatePolicy(
                    .deviceOwnerAuthenticationWithBiometrics,
                    localizedReason: reason
                ) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.alertTitle = "Biometric Authentication Error"
                        self.alertMessage = authenticationError?.localizedDescription ?? "Oops!. Something went wrong, please try again."
                        self.showingAlert = true
                    }
                }
            } else {
                self.alertTitle = "Support Error"
                self.alertMessage = error?.localizedDescription ?? "Biometric authentication not supported!"
                self.showingAlert = true
            }
        }
    }
}


extension EditView {
    @Observable
    class ViewModel {
        //
    }
}
