//
//  ContentView.swift
//  chrisharper22-SoundVisualizer
//
//  Created by Chris Harper on 7/21/22.
//

import SwiftUI
import Combine

struct ContentView: View {
	let timer = Timer.publish(every: 0.35, on: .main, in: .common).autoconnect()
	
	let originalColor = Color(red: 0.11, green: 0.73, blue: 0.33, opacity: 1.00)
	
	@State private var color: Color = .red
	
	var body: some View {
		VStack {
			Spacer()
			barStack
			Spacer()
			settingsView
			Spacer()
		}
		.animation(.easeInOut, value: color)
		.padding()
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.preferredColorScheme(.dark)
	}
	
	var barStack: some View {
		HStack(alignment: .bottom, spacing: 10) {
			ForEach(0...3, id: \.self) { _ in
				BarView(timer: timer)
					.foregroundColor(color)
			}
		}
		.frame(width: 175, height: 200, alignment: .bottom)
	}
	
	var settingsView: some View {
		VStack(alignment: .leading, spacing: 0) {
			ColorPicker("Bar Color", selection: $color, supportsOpacity: false)
				.padding()
			if color != originalColor {
				Divider()
				Button(role: .destructive) {
					color = originalColor
				} label: {
					Text("Reset Color")
						.frame(maxWidth: .infinity, alignment: .leading)
				}
				.padding()
			}
		}
		.background {
			RoundedRectangle(cornerRadius: 10, style: .continuous)
				.fill(Color(uiColor: .secondarySystemGroupedBackground))
		}
	}
}

struct BarView: View {
	let timer: Publishers.Autoconnect<Timer.TimerPublisher>
	
	@State private var height: CGFloat = 100
	
	var body: some View {
		Rectangle()
			.onReceive(timer) { _ in
				height = .random(in: 5...200)
			}
			.clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
			.animation(.easeInOut, value: height)
			.frame(height: height)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
