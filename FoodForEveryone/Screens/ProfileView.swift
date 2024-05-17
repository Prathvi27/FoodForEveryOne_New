import SwiftUI

struct ProfileMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileHeaderView()
            Divider()
            MenuItemView(icon: "list.bullet", text: "My Orders")
            MenuItemView(icon: "person.fill", text: "My Profile")
            MenuItemView(icon: "mappin.and.ellipse", text: "Delivery Address")
            MenuItemView(icon: "creditcard", text: "Payment Methods")
            MenuItemView(icon: "envelope.fill", text: "Contact Us")
            MenuItemView(icon: "gearshape.fill", text: "Settings")
            MenuItemView(icon: "questionmark.circle.fill", text: "Helps & FAQs")
            Spacer()
            LogoutButtonView()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, content: {
            Image("profileIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.yellow)
                .clipShape(Circle())
                .padding(.bottom, 10)
            
            Text("Farion Wick")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("farionwick@gmail.com")
                .font(.subheadline)
                .foregroundColor(.gray)
        })
    }
}

struct MenuItemView: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 24, height: 24)
            
            Text(text)
                .font(.system(size: 18))
            
            Spacer()
        }
    }
}

struct LogoutButtonView: View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack {
                Image(systemName: "power")
                    .foregroundColor(.white)
                
                Text("Log Out")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
        }
        .padding(.bottom, 20)
    }
}

struct ProfileMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMenuView()
            .previewLayout(.sizeThatFits)
    }
}
