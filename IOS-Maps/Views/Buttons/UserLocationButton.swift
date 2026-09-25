import SwiftUI
import MapKit

public struct UserLocationButton: View {
    @Namespace public var mapScope

    public init() {}

    public var body: some View {
        MapUserLocationButton(scope: mapScope)
            .mapScope(mapScope)
    }
}