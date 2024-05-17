import Foundation

struct CartItem: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var price: Double
    var quantity: Int
}
