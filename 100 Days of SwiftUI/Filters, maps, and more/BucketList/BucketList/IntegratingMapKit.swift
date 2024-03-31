//
//  IntegratingMapKit.swift
//  BucketList
//
//  Created by ☕️ Gabo.montero on 3/31/24.
//

import SwiftUI
import MapKit

struct MapStyle: View {
    var body: some View {
        Map()
            .mapStyle(.imagery) // .. represents a satellite map
            .mapStyle(.hybrid) // .. or combine both satellite and street map
            .mapStyle(.hybrid(elevation: .realistic)) // .. or both maps along with realistic elevation, creating a 3D map
    }
}

struct MapInteractionModes: View {
    var body: some View {
        // .. a map that always remains centered on a particular location,
        // .. but users can still adjust the rotation and zoom
        Map(interactionModes: [.rotate, .zoom])
        
        // .. or we could specify no interaction modes,
        Map(interactionModes: []) // .. meaning that the map is always exactly fixed
    }
}

/**
 * Customizaion options
 * ---
 * 1. Controlling the position
 * 2. Placing annotations
 * 3. Handling taps
 */

// .1. To customize the position of the camera, to change the position...
struct MapCameraPositionView: View {
    // ... over time you'll need to make it as:
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), // .. initial position "London"
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1) // with a span specified as 1 degree by 1 degree
        )
    )
    
    var body: some View {
        VStack {
            Map(position: $position)
                // .. tell us when the position changes, either immediately or once movement has ended
                //.onMapCameraChange { context in
                    //print(context.region)
                //}
                // .. or we can have it post continous updates
                .onMapCameraChange(frequency: .continuous) { context in
                    print(context.region)
                }
            
            HStack(spacing: 50) {
                Button("Paris") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
                
                Button("Tokyo") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
            }
        }
    }
}

// .2. Placing annotations
struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MapAnnotations: View {
    // .2.a. an array of locations, wherever we want map annotations to appear
    let locations = [
        Location(
            name: "Buckingham Palace",
            coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)
        ),
        Location(
            name: "Tower of London",
            coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)
        )
    ]
    
    var body: some View {
        Map {
            ForEach(locations) { location in
                //Marker(location.name, coordinate: location.coordinate)
                // .. to have more control over the way your markers look on the map
                // .. use an (Annotation) instead:
                Annotation(location.name, coordinate: location.coordinate) {
                    Text(location.name)
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
                .annotationTitles(.hidden)
            }
        }
    }
}

// .3. You can handle taps on the map using (onTapGesture)
// .. this tells us where on the map the user tapped, but it does so in screen coordinates
// .. - e.g., 50 points from top, and 100 points from the left
struct MapTapGesture: View {
    var body: some View {
        // .. to get an actual location on the map,
        MapReader { proxy in // .. we need a special view called (MapReader)
            Map()
                .onTapGesture { position in
                    // .. able to convert screen locations to map locations and back the other way
                    if let coordinate = proxy.convert(position, from: .local) {
                        // (.local): we'reconverting that position in the map's local coordinate space:
                        // .. the tap location we're working is relative to the (top-left) corner of the map
                        // .. rather than the whole screen or some other coordinate space
                        print(coordinate)
                    }
                }
        }
    }
}

struct IntegratingMapKit: View {
    var body: some View {
        //Map(initialPosition: position)
        MapTapGesture()
    }
}

#Preview {
    IntegratingMapKit()
}
