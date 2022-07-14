//
//  ContentView.swift
//  Sahil_Sahu-SpotifyNowPlayingAnimation
//
//  Created by Sahil Sahu on 13/07/22.
//

import SwiftUI

//MARK: How it works

/// There are 4 rectangles embedded in a HStack, we keep changing the heights of the rectangles using a timer that is published every 0.3 seconds.
/// We change the heights in 2 ways-
/// 1. by changing the current height index in the heights list
/// 2. by changing which rectangle points to which index in the heights list
///
///Once the currHeightIdx variable reaches 4, we shuffle our heights and heightsIndexes lists, and set currHeightIdx = 0
///


struct ContentView: View {
    
    @State var heights = [[100,100,100,100], [50,105,150,120], [105,78,12,34], [5,100,130,170],
                   [103,43,110,54]]
    
    @State var currHeightIdx = 0
    @State var heightIndexes = [0,1,2,3]
    
    var timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
       
            HStack(alignment: .bottom){
                
                Rectangle()
                    .frame(width: 20, height: CGFloat(heights[currHeightIdx][heightIndexes[0]]))
                    .animation(.linear, value: currHeightIdx)
                    
                Rectangle()
                    .frame(width: 20, height: CGFloat(heights[currHeightIdx][heightIndexes[1]]))
                    .animation(.linear, value: currHeightIdx)
                Rectangle()
                    .frame(width: 20, height: CGFloat(heights[currHeightIdx][heightIndexes[2]]))
                    .animation(.linear, value: currHeightIdx)
                Rectangle()
                    .frame(width: 20, height: CGFloat(heights[currHeightIdx][heightIndexes[3]]))
                    .animation(.linear, value: currHeightIdx)
                    .onReceive(timer){ _ in
                        
                        if currHeightIdx == 4 {
                            currHeightIdx = 0
                            heightIndexes.shuffle()
                            heights.shuffle()
                        }
                        else{
                            currHeightIdx += 1
                        }
                        
                    }
                
            }
            .foregroundColor(Color.green)
            .frame(height: 200, alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
