import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // Assuming you have an image named "logo" in your asset catalog
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Adjust the size as needed

                Text("Food for Everyone")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.top, 20)

                Spacer()

                NavigationLink(destination: OnboardingView1().navigationBarBackButtonHidden(true)) {
                    Text("Get Started")
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50) // Adjust size as needed
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
        }
    }
}


// To see the preview in SwiftUI
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
