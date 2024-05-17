import SwiftUI

struct DonateView: View {
    @State private var selectedRole: String? = nil
    @State private var navigateToHomePage = false // State for navigating to HomePage

    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                Text("Choose your category")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                //Spacer()
                
                // Donor Role Button
                RoleSelectionButton(
                    imageName: "Raw Food", // Make sure the image name matches your asset catalog
                    isSelected: selectedRole == "Raw Food",
                    action: {
                        self.selectedRole = "Raw Food"
                        navigateToHomePage = true
                    }
                )
                
                // Hungry Role Button
                RoleSelectionButton(
                    imageName: "Cooked Food", // Make sure the image name matches your asset catalog
                    isSelected: selectedRole == "Cooked Food",
                    action: {
                        self.selectedRole = "Cooked Food"
                        navigateToHomePage = true
                    }
                )
                
                // Hungry Role Button
                RoleSelectionButton(
                    imageName: "Packed Food", // Make sure the image name matches your asset catalog
                    isSelected: selectedRole == "Packed Food",
                    action: {
                        self.selectedRole = "Packed Food"
                        navigateToHomePage = true
                    }
                )
                
                Spacer()
            }
        }
        .background(
            NavigationLink("", destination: NavigationBarView(), isActive: $navigateToHomePage)
        )
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
    }
}

    struct DonateFoodSelectionButton: View {
        var imageName: String
        var isSelected: Bool
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isSelected ? Color.green : Color.clear, lineWidth: 4)
                    )
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }

    // Preview provider
    struct DonateView_Previews: PreviewProvider {
        static var previews: some View {
            DonateView()
        }
    }
