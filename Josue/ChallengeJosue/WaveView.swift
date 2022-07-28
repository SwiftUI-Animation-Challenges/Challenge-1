//
//  WaveView.swift
//  ChallengeJosue
//
//  Created by Josue Hernandez on 25-07-22.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}

struct WaveView: View {
    @State private var heightBar: CGFloat = 0.0

         var body: some View {
             GeometryReader { geometry in
                 VStack(spacing: 0) {
                     Rectangle().fill(.clear)
                     Rectangle()
                         .fill(Color.random)
                         .frame(height: geometry.size.height * heightBar)
                 }
                 .animation(.default, value: heightBar)
             }
             .onAppear {
                 setHeightBar()
             }
         }

         func setHeightBar() {
             let delayValue = CGFloat.random(in: 0...0.2)
             heightBar = CGFloat.random(in: 0...2)
             DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delayValue)) {
                 self.setHeightBar()
             }
         }
}


struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}
