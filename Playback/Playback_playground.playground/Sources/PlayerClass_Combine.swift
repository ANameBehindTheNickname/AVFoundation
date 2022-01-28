import AVFoundation
import Combine

public class PlayerClass_Combine: NSObject {
    private let url = Bundle.main.url(forResource: "Second video", withExtension: "mp4")!
    private let asset: AVAsset
    private let playerItem: AVPlayerItem
    private let player: AVPlayer
    
    private var playerItemContext = "playerItemContext"
    
    private var cancellable: AnyCancellable?
    
    override public init() {
        self.asset = .init(url: url)
        self.playerItem = .init(asset: asset)
        self.player = .init()
        super.init()
        
        cancellable = playerItem.publisher(for: \.status)
            .sink { status in
                switch status {
                case .readyToPlay:
                    print("Combine example - ready to play\n")
                case .failed:
                    print("Combine example - failed\n")
                case .unknown:
                    print("Combine example - unknown\n")
                @unknown default:
                    print("Combine example - unknown default\n")
                }
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player.replaceCurrentItem(with: self.playerItem)
        }
    }
    
    // I've heard about issues with observation and memory leaks, but I don't dig into that for now
//    deinit {
//        cancellable?.cancel()
//    }
}
