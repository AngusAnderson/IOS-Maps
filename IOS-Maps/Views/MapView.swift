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

    var body: some View {
        Map(position: $position) {
            if let userLocation = viewModel.userLocation {
                Marker("You are here", coordinate: userLocation)
                    .tint(.blue)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.requestLocationAccessAndStartUpdates()
        }
    }
}
