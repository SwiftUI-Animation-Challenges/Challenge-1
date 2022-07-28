//
//  ContentView.swift
//  SpotifyAnimationChallenge
//
//  Created by Silviu Vranau on 14.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.17, green: 0.20, blue: 0.20, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(0 ..< 4, id: \.self) { _ in
                        Element()
                    }
                }
                .frame(maxHeight: 500, alignment: .bottom)
                Spacer()
                Text("Silviu")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
}

struct Element: View {
    @State var height: CGFloat = 100
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .foregroundColor(.green)
            .frame(width: 45, height: height, alignment: .bottom)
            .onReceive(timer) { _ in
                withAnimation(.spring()) {
                    height = getRandomHeight()
                }
            }
    }
    
    private func getRandomHeight() -> CGFloat {
        return CGFloat.random(in: 25...250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
