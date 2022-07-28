//
//  Extensions.swift
//  SpotifyNowPlaying
//
//  Created by Stefan Blos on 26.07.22.
//

import SwiftUI

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}

extension CGFloat {
    static var maxHeight: CGFloat = 200
    static var cornerRadius: CGFloat = 2
}

extension Double {
    static var animationDuration: Double = 0.3
}

extension Color {
    static var spotifyGreen: Color = Color(.displayP3, red: 30 / 255.0, green: 215 / 255.0, blue: 96 / 255.0, opacity: 1)
    static var spotifyBlack: Color = Color(.displayP3, red: 25 / 255.0, green: 20 / 255.0, blue: 20 / 255.0, opacity: 1)
}
