//
//  ContentView.swift
//  Shared
//
//  Created by Inncoder on 15/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.darkBackground.edgesIgnoringSafeArea(.all)
    
            ForEach(0..<360, id: \.self) { i in
                VisualizerBar(maxHeight: 25, minHeight: 1, width: 1)
                    .offset(y: 150)
                    .rotationEffect(.degrees(1 * Double(i)))
            }
            
            HStack(spacing: 4) {
                ForEach(0..<4) { i in
                    VisualizerBar(maxHeight: 75, minHeight: 10, width: 15)
                }
            }
            
            Text("Inncoder")
                .foregroundColor(.white)
        }
    }
}

struct VisualizerBar: View {
    @State private var height: CGFloat = 0
    
    let animationSpeed: Double = 0.3
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: width / 5)
                .frame(width: width, height: height)
                .animation(.easeInOut(duration: animationSpeed), value: height)
                .foregroundColor(.greenPrimary)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: animationSpeed, repeats: true) { _ in
                        height = CGFloat.random(in: minHeight...maxHeight)
                    }
                }
        }
        .frame(height: maxHeight, alignment: .bottom)
    }
}

extension Color {
    static var greenPrimary: Color { Color(red: 0.11, green: 0.73, blue: 0.33) }
    static var darkBackground: Color { Color(red: 0.10, green: 0.08, blue: 0.08) }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
