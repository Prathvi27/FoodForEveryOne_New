import SwiftUI

struct ProductListView: View {
    // Sample data for demonstration
    @State private var selectedProduct: String? = nil

    @State private var navigateToCart: Bool = false 
    @EnvironmentObject var cartManager: CartManager// State to control navigation
    
    
    let items = [
        ("Butter Chicken", "", "$13.00", "butterchicken"),
        ("Butter Naan", "", "$2.00", "butternaan"),
        ("Biryani", "", "$9.00", "biryani"),
        ("Vadapav", "", "$5.00", "vadapav"),
        ("Masala Dosa", "", "$8.00", "masala dosa"),
        ("Mango Lassi", "", "$7.00", "mango lassi")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading) {
                    header
                    searchBar
                    Text("Menu")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding([.leading, .top])
                    productGrid
                }
                .padding(.horizontal, cartManager.cartItems.isEmpty ? 20 : 80)
            }
            .background(Color.white)
            
            //   CustomNavigationBar()
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
                print("Menu button clicked")
            }) {
                Image("menuIcon")
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
                Image("profileIcon")
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
        .padding(.horizontal)
        .padding(.top, 10)
        .shadow(radius: 1)
        
    }
    
    var productGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            ForEach(items, id: \.0) { item in
                Button(action: {
                    selectedProduct = item.0
                }) {
                    if let priceDouble = Double(item.2.trimmingCharacters(in: CharacterSet(charactersIn: "$"))) {
                                        productCard(title: item.0, subtitle: item.1, price: priceDouble, imageName: item.3)
                                    } else {
                                        productCard(title: item.0, subtitle: item.1, price: 0.0, imageName: item.3) // Default price in case of error
                                    }
                                }
                .background(selectedProduct == item.0 ? Color.green.opacity(0.3) : Color.clear)
                .cornerRadius(20)
            }
        }
        .padding(.top, 20)
    }
    
    
    func productCard(title: String, subtitle: String, price: Double, imageName: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(imageName) // Ensure images are added to your asset catalog
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
                    Image("cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .cornerRadius(10)
                        .padding(.leading, 5)
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
struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
