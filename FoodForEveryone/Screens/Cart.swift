import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    @State private var navigateToNextPage = false // State for navigating to nextPage

    var body: some View {
        NavigationView {
            VStack {
                Text("Your Cart")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                if cartManager.cartItems.isEmpty {
                    Text("Your cart is empty")
                        .font(.title)
                } else {
                    ScrollView {
                        ForEach($cartManager.cartItems) { $item in
                            CartItemView(cartItem: $item)
                        }
                    }
                }
                
                Button(action: {
                    navigateToNextPage = true
                }) {
                    Text("CHECKOUT")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
                .background(
                    NavigationLink("", destination: LocationSelectionView(), isActive: $navigateToNextPage)
                )
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
            .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
        }
    }
}

struct CartItemView: View {
    @Binding var cartItem: CartItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cartItem.name)
                    .font(.headline)
                Text("\(cartItem.quantity) x $\(cartItem.price, specifier: "%.2f") = $\(Double(cartItem.quantity) * cartItem.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            Spacer()
            Button(action: {
                // Decrease quantity
                if cartItem.quantity > 1 {
                    cartItem.quantity -= 1
                } else {
                    // Remove item from cart
                }
            }) {
                Image(systemName: "minus.circle")
            }
            Button(action: {
                // Increase quantity
                cartItem.quantity += 1
            }) {
                Image(systemName: "plus.circle")
            }
        }
        .padding()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(CartManager())
    }
}
