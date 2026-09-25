import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()

    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 55.951238, longitude: -4.043388),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )

    @State private var tappedCoordinate: CLLocationCoordinate2D?

    var body: some View {
        ZStack {
            Map(position: $position) {
                if let userLocation = viewModel.userLocation {
                    Marker("You are here", coordinate: userLocation)
                        .tint(.blue)
                }

                if let tappedCoordinate = tappedCoordinate {
                    Marker("Tapped", coordinate: tappedCoordinate)
                        .tint(.red)
                }
            }
            .mapControls {
                MapUserLocationButton()
            }
            .ignoresSafeArea()
            .onAppear {
                viewModel.requestLocationAccessAndStartUpdates()
            }

            MapReader { proxy in
                Color.clear
                    .contentShape(Rectangle())
                    .allowsHitTesting(true)
                    .onTapGesture { point in
                        if let coordinate = proxy.convert(point, from: .local) {
                            tappedCoordinate = coordinate
                            print("Tapped at:", coordinate.latitude, coordinate.longitude)
                        }
                    }
            }
            .allowsHitTesting(false)
        }
    }
}