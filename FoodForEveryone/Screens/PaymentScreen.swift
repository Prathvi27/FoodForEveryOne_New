import SwiftUI

struct PaymentScreen: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToNextPage = false // State for navigating to nextPage

    var tax = 5.30
    var delivery = 1.00
    var lastFourDigits = 3095
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($cartManager.cartItems) { $item in
                    CartItemView(cartItem: $item)
                }
                VStack {
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text("$\(String(format: "%.2f", cartManager.cartItems.map{ Double($0.quantity) * $0.price }.reduce(0.0, +))) USD")
                    }
                    HStack {
                        Text("Tax and Fees")
                        Spacer()
                        Text("$\(String(format: "%.2f", tax)) USD")
                    }
                    HStack {
                        Text("Delivery")
                        Spacer()
                        
                        Text("$\(String(format: "%.2f", delivery)) USD")
                    }
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("$\(String(format: "%.2f", cartManager.cartItems.map{ Double($0.quantity) * $0.price }.reduce(0.0, +) + tax + delivery)) USD")
                    }
                    
                    Spacer()
                        .frame(height: 20) // Fixed height spacer
                    
                    Text("Payment Method")
                    HStack {
                        Image("card")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 8)
                        
                        Spacer()
                        
                        Text("**** **** **** \(lastFourDigits)")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(Color.gray)
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 50) // Fixed height spacer
                    
                    Button("Pay") {
                        cartManager.emptyCart()
                        navigateToNextPage = true
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .background(
                        NavigationLink("", destination: SuccessScreen(), isActive: $navigateToNextPage)
                    )
                }
                .padding()
            }
            Spacer()
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
    }
}

// Preview provider
struct PaymentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentScreen()
    }
}
