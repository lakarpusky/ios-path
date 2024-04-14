//
//  LocationMapView.swift
//  ConsolidationVI
//
//  Created by ☕️ Gabo.montero on 4/13/24.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @Environment(\.dismiss) var dismiss
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var manager = LocationFetcher()
    
    init() {
        manager.requestLocation()
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(
                position: $position,
                interactionModes: [.rotate, .zoom]
            ) {
                if let location = position.region?.center {
                    Annotation("Location", coordinate: location) {
                        Image(systemName: "mappin.and.ellipse.circle")
                            .resizable()
                            .foregroundStyle(.red.opacity(0.8))
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                    }
                }
            }
            .mapStyle(.standard(elevation: .flat))
            .onAppear {
                if let location = manager.lastKnownLocation {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: location,
                            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                        )
                    )
                }
            }
            
            HStack {
                Button("Close", role: .cancel) { 
                    dismiss()
                }
                .font(.headline.weight(.bold))
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
}

#Preview {
    LocationMapView()
}
