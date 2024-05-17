import SwiftUI

struct Resturantslist: View {
    @State private var selectedRestaurant: String?

    let restaurants = ["Chatkaaz", "Dosa-Hut", "Secret Kitchen", "Bawarchi", "Student Biryani"]

    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                ScrollView {
                    VStack {
                        header
                        searchBar
                        featuredRestaurants
                    }
                    .background(Color.white)
                }
            }
         //       CustomNavigationBar()
            }
            .edgesIgnoringSafeArea(.bottom) // Ensures the navigation bar extends to the bottom edge
        }


    var header: some View {
        HStack {
            Button(action: {
                print("Menu button clicked")
            }) {
                Image("menuIcon") // Make sure you have this asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                    .padding(.leading, 20)
            }
            Spacer()
            Text("4102 Pretty View Lane")
                .font(.headline)
                .padding(.horizontal)
            Spacer()
            Button(action: {
                print("Profile button clicked")
            }) {
                Image("profileIcon") // Make sure you have this asset
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                    .padding(.trailing, 20)
            }
        }
        .padding(.vertical, 10)
        .background(Color.white)
    }

    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Find for food or restaurant...", text: .constant(""))
        }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 1)
        .padding(.horizontal)
        .padding(.top, 10)
    }

    var featuredRestaurants: some View {
        VStack(alignment: .leading) {
            Text("Restaurants")
                .font(.headline)
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(restaurants, id: \.self) { name in
                        NavigationLink(destination: ProductListView()) {
                            restaurantCard(name: name)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    func restaurantCard(name: String) -> some View {
        VStack(alignment: .leading) {
            Image(name) // Placeholder for actual images, ensure you have these in your assets
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 330, height: 200)
                .clipped()
                .cornerRadius(20)

            Text(name)
                .font(.headline)
                .padding(.top, 5)

            HStack {
                Text("Free delivery")
                Spacer()
                Text("10-15 mins")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .frame(width: 330)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .foregroundColor(.black)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}


struct Resturantslist_Previews: PreviewProvider {
    static var previews: some View {
        Resturantslist()
    }
}
