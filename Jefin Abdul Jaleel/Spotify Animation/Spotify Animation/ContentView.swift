//
//  ContentView.swift
//  Spotify Animation
//
//  Created by Jefin on 06/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4, id: \.self) { _ in
               AnimationView()
            }
        }.frame(width: 300, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
