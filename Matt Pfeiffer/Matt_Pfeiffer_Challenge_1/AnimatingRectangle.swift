//
//  AnimatingRectangle.swift
//  Matt_Pfeiffer_Challenge_1
//
//  Created by Matt Pfeiffer on 7/13/22.
//

import SwiftUI

struct AnimatingRectangle: View {
    @State private var heightValue: CGFloat = 0.0
    let offGreen = Color.init(.displayP3, red: 0.0, green: 1.0, blue: 0.4)
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Rectangle().fill(.clear)
                Rectangle()
                    .fill(offGreen)
                    .frame(height: geo.size.height * heightValue)
            }
            .animation(.default, value: heightValue)
        }
        .onAppear {
            stepHeight()
        }
    }
    
    func stepHeight() {
        let delayValue = CGFloat.random(in: 0...0.75)
        heightValue = CGFloat.random(in: 0...1)
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delayValue)) {
            self.stepHeight()
        }
    }
}

struct AnimatingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingRectangle()
    }
}
