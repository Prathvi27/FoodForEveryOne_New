import SwiftUI

struct OnboardingView2: View {
    @State private var isActiveSkip = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button("Skip") {
                        isActiveSkip = true
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                
                Image("onboarding_image2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.top, 30)
                
                Text("Reduce food waste!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("Save More, Waste Less: Every Bite Counts")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Spacer()
                
                PageControl2()
                
                NavigationLink(destination: OnboardingView3()) {
                    Text("Next")
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                NavigationLink(destination: SignInView(), isActive: $isActiveSkip) {
                    EmptyView()
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

struct PageControl2: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.gray)
                .frame(width: 8, height: 8)
            Circle()
                .fill(Color.green)
                .frame(width: 8, height: 8)
            Circle()
                .fill(Color.gray)
                .frame(width: 8, height: 8)
        }
        .padding(15)
    }
}


// Preview provider for SwiftUI
struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}
