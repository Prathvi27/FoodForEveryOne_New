import SwiftUI

struct SignUpView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToRole = false // State for navigating to Choose Your Role view
    @State private var navigateToSignIn = false // State for navigating to Sign In view
    @State private var showingAlert = false // State for alert
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sign-Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                TextField("Your Full Name", text: $fullName)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 24)
                
                TextField("Your Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                
                SecureField("Your Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                
                Text("By signing up you agree to our Terms & Condition and Privacy Policy.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.top, 10)
                
                Spacer()
                
                Button("Proceed to choose your Role") {
                    if fullName == "" || email == "" || password == "" {
                        showingAlert = true
                    } else {
                        navigateToRole = true // Triggers navigation
                    }
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.bottom, 10)
                .background(
                    NavigationLink("", destination: ChooseYourRoleView(), isActive: $navigateToRole)
                )
                
                HStack {
                    Text("Already signed up?")
                        .foregroundColor(.gray)
                    
                    Button("Login") {
                        navigateToSignIn = true // Triggers navigation to Sign In view
                    }
                    .foregroundColor(.gray)
                    .background(
                        NavigationLink("", destination: SignInView(), isActive: $navigateToSignIn)
                    )
                }
                .padding(.bottom, 10)
            }
            .padding(.top, 60)
            
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
        .alert("Please enter all details and try again!", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

// Ensure you have ChooseYourRoleView and SignInView defined somewhere in your project
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
