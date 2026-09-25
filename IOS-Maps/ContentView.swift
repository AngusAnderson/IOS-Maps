import SwiftUI
import MapKit

struct ContentView: View {

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.951238, longitude: -4.043388), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        Map(initialPosition: .region(region))
    }
}
