//
//  Location.swift
//  FoodForEveryone
//
//  Created by Umang on 16/05/24.
//

import Foundation
import SwiftUI
import MapKit

struct LocationSelectionView: View {
    @State private var selectedSegment = 0
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
        span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
    )
    @State private var navigateToNextPage = false // State for navigating to nextPage
    let routeCoordinates = [
        CLLocationCoordinate2D(latitude: -33.88369, longitude: 151.20242)
    ]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Options", selection: $selectedSegment) {
                    Text("Delivery").tag(0)
                    Text("Pickup").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if selectedSegment == 1 {
                    PickupView() // Displays the pickup view when "Pickup" is selected
                } else {
                    Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: [MapPin(coordinate: routeCoordinates.first!)]) { pin in
                        MapMarker(coordinate: pin.coordinate, tint: .red)
                    }
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(Color.red)
                    Text("Deliver To")
                    Spacer()
                    Text("4102 Pretty View Lane, Parramatta NSW 2150")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                Button("Continue") {
                    navigateToNextPage = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.black)
                .cornerRadius(10)
                .padding(.horizontal)
                .background(
                    NavigationLink("", destination: PaymentScreen(), isActive: $navigateToNextPage)
                )
                Spacer()
            }
//            .navigationTitle("Select")
//            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
            .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
        }
    }
}


struct LocationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelectionView()
    }
}
