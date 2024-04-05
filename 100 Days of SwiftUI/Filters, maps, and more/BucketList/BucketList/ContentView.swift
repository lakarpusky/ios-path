//
//  ContentView.swift
//  BucketList
//
//  Created by ☕️ Gabo.montero on 3/30/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // .4. step
    // .. now we can replace all those properties with a single one:
    @State private var viewModel = ViewModel()
    //@State private var locations = [Location]()
    //@State private var selectedPlace: Location?
    
    @State private var mapStandard = true
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        // .7.d. step
        if viewModel.isUnlocked {
            // .. we need a (MapReader) around our map...
            MapReader { proxy in
                ZStack(alignment: .top) {
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "mappin.and.ellipse.circle")
                                    .resizable()
                                    .foregroundStyle(.red.opacity(0.8))
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .mapStyle(mapStandard ? .standard : .hybrid)
                    // .. the tap location isn't ideal because it gives us
                    .onTapGesture { position in // .. screen coordinates rather than map coordinates
                        print("Tapped at position: \(position)")
                        // .. so we need convert between the two types of coordinates
                        if let coordinate = proxy.convert(position, from: .local) {
                            print("Tapped at coordinate: \(coordinate)")
                            // .5.a. step
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            // .5.b. step
                            viewModel.update(location: $0)
                        }
                    }
                    .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                        //
                    } message: {
                        Text(viewModel.alertMessage)
                    }
                    
                    HStack {
                        Button("Standard", systemImage: mapStandard ? "checkmark.diamond.fill" : "") {
                            mapStandard = true
                        }
                        .padding()
                        .background(.blue.opacity(0.1))
                        .foregroundStyle(!mapStandard ? .white : .secondary)
                        .font(.subheadline.weight(.black))
                        .frame(height: 55)
                        .clipShape(.capsule)
                        
                        Button("Hybrid", systemImage: !mapStandard ? "checkmark.diamond.fill" : "") {
                            mapStandard = false
                        }
                        .padding()
                        .background(.blue.opacity(0.1))
                        .foregroundStyle(mapStandard ? .white : .secondary)
                        .font(.subheadline.weight(.black))
                        .frame(height: 55)
                        .clipShape(.capsule)
                    }
                }
            }
        } else {
            // .7.e. step
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    ContentView()
}
