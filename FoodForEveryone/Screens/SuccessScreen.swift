import SwiftUI

struct SuccessScreen: View {
    @State private var navigateToNextPage = false // State for navigating to nextPage
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 10)
                        .foregroundColor(Color.green)
                    
                    CheckmarkShape()
                        .trim(from: 0.0, to: 1.0)
                        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.yellow)
                        .frame(width: 100, height: 100)
                }
                .frame(width: 120, height: 120)
                
                Text("Your order has been successfully placed")
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures correct behavior on iPad as well
        .navigationBarBackButtonHidden(true) // Re-iterate hiding the back button
    }
}

struct CheckmarkShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0.25 * width, y: 0.5 * height))
        path.addLine(to: CGPoint(x: 0.45 * width, y: 0.7 * height))
        path.addLine(to: CGPoint(x: 0.75 * width, y: 0.3 * height))
        
        return path
    }
}

// Preview provider
struct SuccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessScreen()
    }
}
