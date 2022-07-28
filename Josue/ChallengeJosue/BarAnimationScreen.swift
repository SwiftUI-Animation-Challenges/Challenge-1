//
//  BarAnimationScreen.swift
//  ChallengeJosue
//
//  Created by Josue Hernandez on 25-07-22.
//

import SwiftUI

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

struct BarAnimationScreen: View {

         var body: some View {
             ZStack {
                 HStack {
                     ForEach(0..<20, id: \.self) { _ in
                         WaveView()
                     }
                 }
                 .frame(width: UIScreen.screenWidth, height: 200)
             }
             .ignoresSafeArea()
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .background(.black)
         }
}

struct BarAnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        BarAnimationScreen()
    }
}
