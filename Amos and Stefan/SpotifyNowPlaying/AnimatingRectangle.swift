//
//  AnimatingRectangle.swift
//  SpotifyNowPlaying
//
//  Created by Stefan Blos on 05.07.22.
//

import SwiftUI

struct AnimatingRectangle: View {
    
    @State private var height: CGFloat = .random(in: 0...CGFloat.maxHeight)
    @Binding var showBackRect: Bool
    @Binding var showHueRotation: Bool
    private let lineWidth: CGFloat = 2
    
    var body: some View {
        ZStack {
            if showBackRect {
                RoundedRectangle(cornerRadius: .cornerRadius, style: .continuous)
                    .stroke(Color.spotifyGreen, lineWidth: lineWidth)
                    .hueRotation(.degrees(showHueRotation ? height : 0))
                    .opacity(0.4)
                    .frame(width: 40, height: height)
                    .animation(
                        .easeOut(duration: .animationDuration).delay(0.15),
                        value: height)
                
                RoundedRectangle(cornerRadius: .cornerRadius, style: .continuous)
                    .stroke(Color.spotifyGreen, lineWidth: lineWidth)
                    .hueRotation(.degrees(showHueRotation ? height : 0))
                    .frame(width: 40, height: height)
                    .animation(
                        .easeOut(duration: .animationDuration),
                        value: height)
            }
            
            RoundedRectangle(cornerRadius: .cornerRadius, style: .continuous)
                .fill(Color.spotifyGreen)
                .hueRotation(.degrees(showHueRotation ? height : 0))
                .frame(width: 40, height: height)
                .animation(
                    .easeOut(duration: .animationDuration),
                    value: height)
        }
        .task {
            while true {
                height = .random(in: 1...CGFloat.maxHeight)
                try? await Task.sleep(seconds: .animationDuration)
            }
        }
    }
}

struct AnimatingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingRectangle(showBackRect: .constant(true), showHueRotation: .constant(true))
    }
}
