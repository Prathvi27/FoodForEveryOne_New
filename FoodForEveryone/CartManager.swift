import SwiftUI
import Combine

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []

    func addToCart(product: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(product)
        }
    }
    
    func removeFromCart(productId: UUID) {
        cartItems.removeAll { $0.id == productId }
    }
    
    func emptyCart() {
        cartItems.removeAll()
    }
}
