import SwiftUI
import Combine

struct PlayingRectangle: Shape, Animatable{
    
    var animatableData: CGFloat
    var height: CGFloat
    var width: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(
                to: CGPoint(
                    x: 0 * width,
                    y: 1 * height
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 1 * width,
                    y: 1 * height
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 1 * width,
                    y: 0 + animatableData
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 0 * width,
                    y: 0 + animatableData
                )
            )
            
            path.closeSubpath()
        }
    }
}

struct AnimatableRectangeView: View{
    @State var offset: CGFloat = 0
    @State var newOffsetValue: CGFloat = 0
    @Binding var isPlaying: Bool
    private var duration: Double!
    private var animation: Animation!
    @State private var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    init(isPlaying: Binding<Bool>){
        self._isPlaying = isPlaying
        duration = 0.3
        timer = Timer.publish(every: duration + 0.1, on: .main, in: .common).autoconnect()
        animation = Animation.linear(duration: duration)
    }
    
    
    var body: some View{
        GeometryReader { geometry in
            PlayingRectangle(animatableData: offset,
                             height: geometry.size.height,
                             width: geometry.size.width)
            .fill(Color.green)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .animation(self.animation, value: offset)
            .onReceive(timer){ _ in
                offset = generateHeight(intervalMax: geometry.size.height)
            }
            .onChange(of: isPlaying) { newValue in
                if newValue{
                    self.timer = timer.upstream.autoconnect()
                } else {
                    timer.upstream.connect().cancel()
                }
            }
        }
        
    }
    
    func generateHeight(intervalMax: CGFloat) -> CGFloat{
        return intervalMax * CGFloat(Float.random(in: 0...0.9))
    }
}


struct ContentView: View {
    @State var isPlaying: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            HStack{
                AnimatableRectangeView(isPlaying: $isPlaying)
                AnimatableRectangeView(isPlaying: $isPlaying)
                AnimatableRectangeView(isPlaying: $isPlaying)
                AnimatableRectangeView(isPlaying: $isPlaying)
            }
            .frame(width: 300, height: 300)
            Button("Toggle Animation", action: {
                isPlaying.toggle()
            })
            
        }
        .background(Color.white)
        .onAppear{
            isPlaying = true
        }
    }
}
