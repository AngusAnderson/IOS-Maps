import SwiftUI
import MapKit

struct HeadingConeOverlay: View {
    
    let center: CLLocationCoordinate2D
    let heading: Double
    let radius: CLLocationDistance = 100

    var body: some View {
        MapReader { proxy in
            Path { path in
                guard let start = proxy.convert(center, to: .local) else { return }

                let wedgeAngle: Double = 30  // ±30 degrees
                let steps = 20

                let scale: CGFloat = 5

                path.move(to: start)

                for i in 0...steps {
                    let angleDeg = heading - wedgeAngle + (2 * wedgeAngle) * Double(i) / Double(steps)
                    let angleRad = angleDeg.degreesToRadians
                    let x = start.x + scale * radius * sin(angleRad)
                    let y = start.y - scale * radius * cos(angleRad)
                    path.addLine(to: CGPoint(x: x, y: y))
                }

                path.closeSubpath()
            }
            .fill(Color.blue.opacity(0.2))
        }
    }
}

extension Double {
    var degreesToRadians: Double { self * .pi / 180 }
}