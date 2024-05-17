import SwiftUI

struct ChooseYourRoleView: View {
    @State private var selectedRole: String? = nil
    @State private var navigateToDonatePage = false
    @State private var navigateToContentView = false

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                Image("charity")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.top, 0)
                
                Text("Choose your role")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Make a Difference, Your Way!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                // Donor Role Button
                RoleSelectionButton(
                    imageName: "donorbutton",
                    isSelected: selectedRole == "Donor",
                    action: {
                        self.selectedRole = "Donor"
                        self.navigateToDonatePage = true
                    }
                )
                
                // Hungry Role Button
                RoleSelectionButton(
                    imageName: "hungrybutton",
                    isSelected: selectedRole == "Hungry",
                    action: {
                        self.selectedRole = "Hungry"
                        self.navigateToContentView = true
                    }
                )
                
                Spacer()
                
                // Navigation Links are here but not visible
                NavigationLink("", destination: DonateView(), isActive: $navigateToDonatePage)
                NavigationLink("", destination: NavigationBarView(), isActive: $navigateToContentView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
    }
}

struct RoleSelectionButton: View {
    var imageName: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.green : Color.clear, lineWidth: 4)
                )
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

// Preview provider
struct ChooseYourRoleView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseYourRoleView()
    }
}
