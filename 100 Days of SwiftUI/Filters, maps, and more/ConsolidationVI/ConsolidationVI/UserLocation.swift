//
//  UserLocation.swift
//  ConsolidationVI
//
//  Created by ☕️ Gabo.montero on 4/13/24.
//

import Foundation
import CoreLocation

// so, here's a class that fetches the user's location:
class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        lastKnownLocation = locations.last?.coordinate
    }
}

// steps to use it:
// ...
// 1. add a new key in the (Info) tab for your app's target
// 2. this key is called (Privacy - Location When In Usage Description)
// 3. then give it some sort of value explaining the user why you need their location
