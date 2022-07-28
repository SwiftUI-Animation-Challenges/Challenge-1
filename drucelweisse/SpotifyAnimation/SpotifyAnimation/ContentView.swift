//
//  ContentView.swift
//  SpotifyAnimation
//
//  Created by Andrey Plotnikov on 21.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0...3, id: \.self) { _ in
                BarView()
            }
        }
        .foregroundColor(.green)
        .frame(width: 300, height: 300)
    }
}


struct BarView: View {
    @State var progress: CGFloat = CGFloat.random(in: 0...1)
    
    var body: some View {
        BarRectangle(cornerRadius: 5, topInset: progress)
            .animation(.spring().delay(progress), value: progress)
            .task {
                for await _ in Timer.publish(every: 0.5, on: .main, in: .default).autoconnect().values {
                    progress = CGFloat.random(in: 0...1)
                }
            }
    }
}


struct BarRectangle: Shape {
    var cornerRadius: CGFloat
    var topInset: CGFloat
    
    var animatableData: CGFloat {
        get {
            topInset
        }
        set {
            topInset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let insettedRect = rect.inset(by: UIEdgeInsets(top: topInset * rect.height, left: 0, bottom: 0, right: 0))
        return RoundedRectangle(cornerRadius: cornerRadius).path(in: insettedRect)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
