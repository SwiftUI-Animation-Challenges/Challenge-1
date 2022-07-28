//
//  BarViews.swift
//  WhatsupOpen
//
//  Created by QBuser on 26/07/22.
//

import SwiftUI

struct SwiftBarViews: View {
    
    @State var progressTwo: Double = 0.0
    @State var progressThree: Double = 0.0
    @State var progressFour: Double = 0.0
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { _ in
                BarViews()
            }
        }.frame(width: UIScreen.screenWidth * 0.5, height: 150)
    }
}

struct BarViews_Previews: PreviewProvider {
    static var previews: some View {
        SwiftBarViews()
    }
}

struct BarViews: View {
    @State var progress: Double = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Rectangle()
            .fill(.green)
            .scaleEffect(x: 1, y: progress, anchor: .bottom)
            .onReceive(timer) { input in
                withAnimation(.easeIn(duration: 1.2)) {
                    progress = Double(Float.random(in: 0.0..<1.0))
                }
            }
    }
}
