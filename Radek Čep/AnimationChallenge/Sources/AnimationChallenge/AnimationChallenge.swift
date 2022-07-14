import Combine
import SwiftUI

public struct NowPlayingView: View {
  public let numberOfColumns: Int

  private let timer: Publishers.Autoconnect<Timer.TimerPublisher>
  @State private var columnValues: [Double] = []

  public init(
    numberOfColumns: Int,
    updateInterval: TimeInterval
  ) {
    self.numberOfColumns = numberOfColumns
    self.timer = Timer.publish(every: updateInterval, on: .main, in: .common).autoconnect()
  }

  public var body: some View {
    GeometryReader { proxy in
      VStack {
        Spacer(minLength: 0)

        HStack(alignment: .bottom) {
          ForEach(Array(zip(columnValues.indices, columnValues)), id: \.0) { _, columnValue in
            Rectangle()
              .fill(Color.green)
              .cornerRadius(5)
              .frame(height: proxy.size.height * columnValue)
          }
        }
      }
      .onReceive(timer) { _ in
        withAnimation(.easeOut) {
          columnValues = (0..<numberOfColumns)
            .map { _ in .random(in: 0.05...1) }
        }
      }
    }
  }
}

struct NowPlayingView_Previews: PreviewProvider {
  static var previews: some View {
    NowPlayingView(
      numberOfColumns: 4,
      updateInterval: 1/3
    )
    .frame(width: 300, height: 300)
    .preferredColorScheme(.dark)
  }
}
