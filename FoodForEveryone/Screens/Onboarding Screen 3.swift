import SwiftUI

struct OnboardingView3: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button("Skip") {
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                
                Image("onboarding_image3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.top, 30)
                    
                
                Text("Start saving money")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("Unlock Your Financial Freedom, Start Saving Smarter!")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Spacer()
                
                PageControl3()
                
                NavigationLink(destination: SignInView()) {
                    Text("Next")
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
    }
}


struct PageControl3: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.gray)
                .frame(width: 8, height: 8)
            Circle()
                .fill(Color.gray)
                .frame(width: 8, height: 8)
            Circle()
                .fill(Color.green)
                .frame(width: 8, height: 8)
        }
        .padding(15)
    }
}


// Preview provider for SwiftUI
struct OnboardingView3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView3()
    }
}
