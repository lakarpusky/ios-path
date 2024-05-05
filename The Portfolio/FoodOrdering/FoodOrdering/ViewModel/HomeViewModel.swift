//
//  HomeViewModel.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/4/24.
//

import SwiftUI
import CoreLocation

// .. Fetching User Location
class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var locationManager = CLLocationManager()
    @Published var search = ""
    
    // .. Location details
    @Published var userLocation: CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = false
    
    // .. Menu
    @Published var showMenu = false
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // .. checking Location Access
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("authorized")
            self.noLocation = false
            manager.requestLocation()
        case .denied:
            print("denied")
            self.noLocation = true
        default:
            print("unknown")
            self.noLocation = false
            // .. direct call
            locationManager.requestWhenInUseAuthorization()
            // .. modifying info.plist
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // .. reading User Location and extracting details
        self.userLocation = locations.last
        self.extractLocation()
    }
    
    func extractLocation() {
        CLGeocoder().reverseGeocodeLocation(self.userLocation) { (res, err) in
            guard let safeData = res else { return }
            
            var address = ""
            
            // .. getting area and locality name
            address += safeData.first?.name ?? ""
            address += ", "
            address += safeData.first?.locality ?? ""
            
            self.userAddress = address
        }
    }
}
