import AVFoundation

// BUG: - this approach returns nil. See https://bugs.swift.org/browse/SR-5872
public class PlayerClass_observe_with_bug: NSObject {
    private let url = Bundle.main.url(forResource: "Second video", withExtension: "mp4")!
    private let asset: AVAsset
    private let playerItem: AVPlayerItem
    private let player: AVPlayer
    
    private var playerItemStatusObservation: NSKeyValueObservation?
    
    override public init() {
        self.asset = .init(url: url)
        self.playerItem = .init(asset: asset)
        self.player = .init()
        super.init()
        
        playerItemStatusObservation = playerItem.observe(\AVPlayerItem.status, options: [.old, .new]) { _, change in
            print("observe example with a bug - \(change)\n")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player.replaceCurrentItem(with: self.playerItem)
        }
    }
    
    // I've heard about issues with observation and memory leaks, but I don't dig into that for now
//    deinit {
//        playerItemStatusObservation?.invalidate()
//    }
}
