import SwiftUI
import MapKit

struct PickupView: View {
    @State private var selectedSegment = 1
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
        span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
    )

    // Updated to use `MapPin` which conforms to `Identifiable`
    let routeCoordinates = [
        MapPin(coordinate: CLLocationCoordinate2D(latitude: -33.88369, longitude: 151.20242)),
        MapPin(coordinate: CLLocationCoordinate2D(latitude: -33.88869, longitude: 151.21242))
    ]

    var body: some View {
        NavigationView {
            VStack {
                
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: routeCoordinates) { pin in
                    MapMarker(coordinate: pin.coordinate, tint: .red)
                }
                .cornerRadius(10)
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(Color.blue)
                        Text("Your estimate time")
                        Spacer()
                        Text("15 minutes")
                    }

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color.red)
                        Text("Store location")
                        Spacer()
                        Text("4102 Pretty View Lane, Parramatta NSW 2150")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
            }
        }
    }
}

struct MapPin: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct PickupView_Previews: PreviewProvider {
    static var previews: some View {
        PickupView()
    }
}
