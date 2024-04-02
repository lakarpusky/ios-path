//
//  ContentView.swift
//  BucketList
//
//  Created by ☕️ Gabo.montero on 3/30/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        // .. we need a (MapReader) around our map...
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
            // .. the tap location isn't ideal because it gives us
            .onTapGesture { position in // .. screen coordinates rather than map coordinates
                print("Tapped at position: \(position)")
                // .. so we need convert between the two types of coordinates
                if let coordinate = proxy.convert(position, from: .local) {
                    print("Tapped at coordinate: \(coordinate)")
                    let newLocation = Location(
                        id: UUID(),
                        name: "New location",
                        description: "",
                        latitude: coordinate.latitude,
                        longitude: coordinate.longitude
                    )
                    locations.append(newLocation)
                }
            }
            .sheet(item: $selectedPlace) { place in
                EditView(location: place) { newLocation in
                    if let index = locations.firstIndex(of: place) {
                        locations[index] = newLocation
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
