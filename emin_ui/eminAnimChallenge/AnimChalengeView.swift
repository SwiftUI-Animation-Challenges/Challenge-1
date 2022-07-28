//
//  Created by Emin Grbo -> @emin_ui
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            AnimChalengeView().scaleEffect(x: 3, y: 3).opacity(0.2).blur(radius: 50)
            AnimChalengeView(hasBase: false)
        }
    }
}

struct AnimChalengeView: View {
    
    var hasBase: Bool = true
    @State var toggleAnim = false
    
    var body: some View {
        ZStack {
            if hasBase {
                Color.black
                Color.purple.opacity(0.2)
            }
            
            HStack(spacing: 24) {
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color.pink)
                    .scaleEffect(x: 1, y: toggleAnim ? 0.4 : 1)
                    .blur(radius: toggleAnim ? 5 : 2)
                    .modifier(ShadowLights(toggleAnim: toggleAnim))
                    .animation(.easeInOut(duration: 0.3)
                        .repeatForever(autoreverses: true), value: toggleAnim)
                
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color.pink)
                    .scaleEffect(x: 1, y: toggleAnim ? 0.4 : 1)
                    .blur(radius: toggleAnim ? 4 : 2)
                    .modifier(ShadowLights(toggleAnim: toggleAnim))
                    .animation(.easeIn(duration: 0.35)
                        .repeatForever(autoreverses: true), value: toggleAnim)
                
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color.pink)
                    .scaleEffect(x: 1, y: toggleAnim ? 0.4 : 1)
                    .blur(radius: toggleAnim ? 3 : 1)
                    .modifier(ShadowLights(toggleAnim: toggleAnim))
                    .animation(.easeOut(duration: 0.25)
                        .repeatForever(autoreverses: true), value: toggleAnim)
                
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color.pink)
                    .scaleEffect(x: 1, y: toggleAnim ? 0.4 : 1)
                    .blur(radius: toggleAnim ? 5 : 2)
                    .modifier(ShadowLights(toggleAnim: toggleAnim))
                    .animation(.easeInOut(duration: 0.35)
                        .repeatForever(autoreverses: true), value: toggleAnim)
            }
            .frame(width: 200, height: 200)
            .scaleEffect(x: toggleAnim ? 1 : 1.2, y: toggleAnim ? 1 : 1.2)
            .animation(.spring().repeatForever(), value: toggleAnim)
        }
        .onAppear {
            toggleAnim.toggle()
        }
    }
}

struct ShadowLights: ViewModifier {
    @State var toggleAnim = false
    func body(content: Content) -> some View {
        content
            .shadow(color: .pink, radius: toggleAnim ? 200 : 0, x: 0, y: 0)
            .shadow(color: .pink, radius: toggleAnim ? 50 : 20, x: 0, y: 0).opacity(toggleAnim ? 0.2 : 0.5)
    }
}
