import AVFoundation

public class PlayerClass_observe_fixed: NSObject {
    private let url = Bundle.main.url(forResource: "Second video", withExtension: "mp4")!
    private let asset: AVAsset
    private let playerItem: AVPlayerItem
    private let player: AVPlayer
    
    private var playerItemStatusObserver: NSKeyValueObservation?
    
    override public init() {
        self.asset = .init(url: url)
        self.playerItem = .init(asset: asset)
        self.player = .init()
        super.init()
        
        // Note that you observe player's currentItem status, not a playerItem as with a bug example
        // Works without options:
        playerItemStatusObserver = player.observe(\AVPlayer.currentItem?.status) { closurePlayer, _ in
            switch closurePlayer.currentItem?.status {
            case .readyToPlay:
                print("observe example fixed - ready to play\n")
            case .failed:
                print("observe example fixed - failed\n")
            case .unknown:
                print("observe example fixed - unknown\n")
            case .none:
                print("observe example fixed - nil found\n")
            @unknown default:
                print("observe example fixed - unknown default\n")
            }
        }
                                                      
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player.replaceCurrentItem(with: self.playerItem)
        }
    }
    
    // I've heard about issues with observation and memory leaks, but I don't dig into that for now
//    deinit {
//        playerItemStatusObserver?.invalidate()
//    }
}
