import SwiftUI

struct OnboardingView1: View {
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
                
                Image("onboarding_image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.top, 30)
                
                
                Text("Donate Effortlessly")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("Empower Change, One Donation at a Time")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Spacer()
                
                PageControl1()
                
                NavigationLink(destination: OnboardingView2()) {
                    Text("Next")
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                    
                    NavigationLink(destination: SignInView(), isActive: $isActiveSkip) {
                        EmptyView()
                    }
                }
                .padding(.bottom)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct PageControl1: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.green)
                .frame(width: 8, height: 8)
            Circle()
                .fill(Color.gray)
                .frame(width: 8, height: 8)
            Circle()
                .fill(Color.gray)
                .frame(width: 8, height: 8)
        }
        .padding(15)
    }
}


// To see the preview in SwiftUI
struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}
