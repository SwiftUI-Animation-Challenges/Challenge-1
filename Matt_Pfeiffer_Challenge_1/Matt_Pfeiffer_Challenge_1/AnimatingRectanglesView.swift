//
//  AnimatingRectanglesView.swift
//  Matt_Pfeiffer_Challenge_1
//
//  Created by Matt Pfeiffer on 7/13/22.
//

import SwiftUI

struct AnimatingRectanglesView: View {
    let darkBrown = Color.init(.displayP3, red: 0.1, green: 0.075, blue: 0.075)
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(0..<4, id: \.self) { _ in
                    AnimatingRectangle()
                }
            }
            .frame(width: 175, height: 175)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(darkBrown)
    }
}

struct AnimatingRectanglesView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingRectanglesView()
    }
}
