//
//  AnimationView.swift
//  Spotify Animation
//
//  Created by Jefin on 06/09/22.
//

import SwiftUI

struct AnimationView: View {
    @State var progression: Double = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Rectangle()
            .fill(Color("Spotify Green"))
            .scaleEffect(x: 1, y: progression, anchor: .bottom)
            .onReceive(timer) { _ in
                withAnimation(.easeIn(duration: 1.0)) {
                    progression = Double(Float.random(in: 0.0..<1.0))
                }
            }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
