import SwiftUI

struct HomePageView: View {
    @State private var selectedRestaurant: String?
    @State private var selectedPopularItem: String?
    @State private var navigateToCart: Bool = false  // State to control navigation
    @State private var navigateToMenu: Bool = false  // State to control navigation
    @EnvironmentObject var cartManager: CartManager

    
    let restaurants = ["Chatkaaz", "Dosa-Hut", "Secret Kitchen", "Bawarchi", "Student Biryani"]
    let popularItems = [
        ("Butter Chicken", "", "$13.00", "butterchicken"),
        ("Butter Naan", "", "$2.00", "butternaan"),
        ("Biryani", "", "$9.00", "biryani"),
        ("Vadapav", "", "$5.00", "vadapav"),
        ("Masala Dosa", "", "$8.00", "masala dosa"),
        ("Mango Lassi", "", "$7.00", "mango lassi")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ScrollView {
                    VStack(spacing: 20) {
                        header
                        searchBar
                        featuredRestaurants
                        popularItemsView
                    }
                    .padding(.bottom, cartManager.cartItems.isEmpty ? 20 : 80)
                    .background(Color.white)
                }
                .scrollIndicators(.hidden)
            }
            // NavigationBarView()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
        .edgesIgnoringSafeArea(.bottom) // Ensures the navigation bar extends to the bottom edge
    }

    
    var header: some View {
        HStack {
            Button(action: {
                navigateToMenu = true
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
                navigateToMenu = true
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
                .foregroundStyle(.black)
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
                HStack{
                    Text("Featured Restaurants")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding()
                    Spacer()
                    Button("View All") {
                        // Review action
                    }
                    .padding()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(Array(restaurants.prefix(4)), id: \.self) { name in
                            NavigationLink(destination: ProductListView()) {
                                restaurantCard(name: name)
                            
                            }

                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    
    var popularItemsView: some View {
            VStack(alignment: .leading) {
                HStack{
                    Text("Popular Items")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding()
                    Spacer()
                    Button("View All") {
                        // Review action
                    }
                    .padding()
                }
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                    ForEach(Array(popularItems.prefix(4)), id: \.0) { item in
                        
                        let priceDouble = Double(item.2.trimmingCharacters(in: CharacterSet(charactersIn: "$"))) ?? 0.0
                        
                        NavigationLink(destination: ProductView(productName: item.0, productImage: item.3, productDescription: item.1, productPrice: priceDouble)) {
                            popularItemCard(title: item.0, subtitle: item.1, price: priceDouble, imageName: item.3)
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
        }
    
    func restaurantCard(name: String) -> some View {
        VStack(alignment: .leading) {
            Image(name) // Make sure you have this image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 150)
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
        .frame(width: 250)
        .padding()
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(selectedRestaurant == name ? Color.green : Color.gray, lineWidth: 0.5)
        )
    }
    
    func popularItemCard(title: String, subtitle: String, price: Double, imageName: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(imageName) // Ensure these images are correctly named and in your assets
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 110)
                .clipped()
                .cornerRadius(20)
            HStack {
                VStack(alignment: .leading) {
                    Text("$" + "\(price)")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                Spacer()
                Button(action: {
                    cartManager.addToCart(product: CartItem(name: title, description: subtitle, price: price, quantity: 1))
                    print("Add to cart tapped for \(title)")
                }) {
                    Image("cart") // Ensure the cart image is in your assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .cornerRadius(10)
                        .padding(.leading, 5)
                }
                // Invisible NavigationLink
                NavigationLink(destination: CartView(), isActive: $navigateToCart) {
                    EmptyView()
                }
                NavigationLink(destination: ProfileMenuView(), isActive: $navigateToMenu) {
                    EmptyView()
                }
            }
            .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
