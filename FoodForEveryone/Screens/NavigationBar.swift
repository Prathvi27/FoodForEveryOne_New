import SwiftUI

struct NavigationBarView: View {
    @EnvironmentObject var system: CartManager

    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Resturantslist()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            ProductListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Products")
                }
            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Order")
                }
        }
        .accentColor(.green)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .environmentObject(CartManager())
    }
}
