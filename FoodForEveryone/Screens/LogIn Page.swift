import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var navigateToSignUp = false // State for navigating to SignUpView
    @State private var navigateToHomePage = false // State for navigating to HomePage
    @State private var showingAlert = false // State for alert
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                TextField("Your Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                    .padding(.horizontal, 24)
                
                SecureField("Your Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                
                HStack {
                    Button(action: {
                        rememberMe.toggle()
                    }) {
                        HStack {
                            Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                .foregroundColor(rememberMe ? .green : .gray)
                            Text("Remember Me")
                        }
                        .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button("Forgot Password?") {
                        // Action for Forgot Password
                    }
                    .foregroundColor(.gray)
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                
                Spacer()
                
                Button("Login") {
                    // TODO: for now static id & password
                    // replace while adding db
                    if email == "Test@email.com" && password == "Admin@123" {
                        navigateToHomePage = true // Triggers navigation
                    } else {
                        showingAlert = true
                    }
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .padding(.bottom, 15)
                .background(
                    NavigationLink("", destination: NavigationBarView(), isActive: $navigateToHomePage)
                )
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    
                    Button("Signup") {
                        self.navigateToSignUp = true // Triggers navigation to SignUpView
                    }
                    .foregroundColor(.gray)
                    .background(
                        NavigationLink(isActive: $navigateToSignUp, destination: {
                            SignUpView()
                        }, label: { EmptyView() })
                    )
                }
                .padding(.bottom, 10)
            }
            .padding(.top, 60)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
        .alert("Please enter correct details and try again!", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

// Preview provider
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
