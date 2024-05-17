import SwiftUI

struct ProductView: View {
    let productName: String
    let productImage: String
    let productDescription: String
    let productPrice: Double
    @EnvironmentObject var cartManager: CartManager

    
    var body: some View {
        VStack {
            // Image container
                       GeometryReader { geometry in
                           Image(productImage)  // Make sure this image is in your assets
                               .resizable()
                               .aspectRatio(contentMode: .fit) // Maintains the aspect ratio, but fills the frame
                               .frame(width: geometry.size.width, height: geometry.size.height * 0.9) // Full height of the GeometryReader
                               .clipped()
                               .cornerRadius(20)
                               .padding(.top, 100)  // Adds top padding to account for navigation space
                       }
                       .frame(width: 350, height: 300)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(productName)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 100)
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundColor(.green)
                            .padding(.top, 100)
                    }
                    
                    
                    HStack {
                        Text("4.5")
                            .fontWeight(.bold)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("(30+)")
                    }
                    
                    Text("Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Amet Ut Nec Vitae Gravida Ullamcorper. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Amet Ut Nec Vitae Gravida Ullamcorper.")
                        .padding(.top, 5)
                    
                    Spacer(minLength: 100)

                    Button(action: {
                        let newProduct = CartItem(name: productName, description: productDescription, price: productPrice, quantity: 1)
                                                cartManager.addToCart(product: newProduct)
                                                print("Added to cart: \(productName)")
                    }) {
                        Text("Add to Cart")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
                }
                               .padding()
                           }
                       }
                       .edgesIgnoringSafeArea(.top)
                   }
               }

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(productName: "Butter Chicken", productImage: "butterchicken", productDescription: "Detailed description", productPrice: 13.0)
            .environmentObject(CartManager()) // Providing the CartManager here
    }
}
