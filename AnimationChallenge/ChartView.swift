//
//  ChartView.swift
//  AnimationChallenge
//
//  Created by Adam Socki on 7/14/22.
//

import SwiftUI



struct ChartView: View {
    @State private var flag = false
    
    @State private var heightsIndex = 0
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    //let timer2 = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var heights: [CGFloat] = [20, 40, 60, 80, 100]
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .infinity, height:.infinity)
                .ignoresSafeArea()
            HStack {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 25, height: heights[0], alignment: .leading)
                    .offset(x: 0, y: -( heights[0]/2) )
                    .animation(.easeInOut, value: heights[0])
//                    .onReceive(timer) { _ in
//                        height = CGFloat(arc4random_uniform(100))
//                    }
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 25, height: heights[1], alignment: .leading)
                    .offset(x: 0, y: -( heights[1]/2) )
                    .animation(.easeInOut, value: heights[1])
//                    .onReceive(timer2) { _ in
//                        height = CGFloat(arc4random_uniform(2 ))
//                    }
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 25, height: heights[2], alignment: .leading)
                    .offset(x: 0, y: -( heights[2]/2) )
                    .animation(.easeInOut, value: heights[2])
////                    .onReceive(timer) { _ in
////                        height = 5
////                    }
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 25, height: heights[3], alignment: .leading)
                    .offset(x: 0, y: -( heights[3]/2) )
                    .animation(.easeInOut, value: heights[3])
////                    .onReceive(timer) { _ in
////                        height = CGFloat.random(in: 1...100)
////                    }
                    
            }
        }
        .onReceive(timer) { _ in
            heights = heights.map{ _ in CGFloat(arc4random_uniform(100)) }
                
            heights.forEach {
                print($0)
            }
        }
        .onAppear {
           
        }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
