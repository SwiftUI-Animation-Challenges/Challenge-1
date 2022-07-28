//
//  ContentView.swift
//  SpotifyNowPlaying
//
//  Created by Stefan Blos on 05.07.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showBackRect = false
    @State private var hueRotationActive = false
    
    var body: some View {
        ZStack {
            Color.spotifyBlack
            
            VStack(spacing: 40) {
                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(0..<4) {_ in
                        AnimatingRectangle(showBackRect: $showBackRect, showHueRotation: $hueRotationActive)
                    }
                }
                .frame(height: .maxHeight, alignment: .bottom)
                
                Toggle("Add back rectangle", isOn: $showBackRect)
                    .foregroundColor(.white)
                
                Toggle("Hue rotation", isOn: $hueRotationActive)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 40)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
