import SwiftUI
import MapKit
import CoreLocation

struct HeadingCone: View {
    let center: CLLocationCoordinate2D
    let heading: Double
    let radius: CLLocationDistance

    var body: some View {
        Path { path in
        }
        .fill(Color.blue.opacity(0.2))
    }
}