import AVFoundation

public class PlayerClass_addObserver: NSObject {
    private let url = Bundle.main.url(forResource: "Second video", withExtension: "mp4")!
    private let asset: AVAsset
    private let playerItem: AVPlayerItem
    private let player: AVPlayer
    
    private var playerItemContext = "playerItemContext"
    
    override public init() {
        self.asset = .init(url: url)
        self.playerItem = .init(asset: asset)
        self.player = .init()
        super.init()
        
        playerItem.addObserver(self,
                               forKeyPath: #keyPath(AVPlayerItem.status),
                               options: [.old, .new],
                               context: &playerItemContext)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player.replaceCurrentItem(with: self.playerItem)
        }
    }
    
    // I've heard about issues with observation and memory leaks, but I don't dig into that for now
//    deinit {
//        playerItem.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.status))
//    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &playerItemContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }

        if keyPath == #keyPath(AVPlayerItem.status) {
            let status: AVPlayerItem.Status

            // Get the status change from the change dictionary
            if let statusNumber = change?[.newKey] as? Int {
                status = AVPlayerItem.Status(rawValue: statusNumber)!
            } else {
                status = .unknown
            }

            // Switch over the status
            switch status {
            case .readyToPlay:
                print("addObserver example - ready to play\n")
            case .failed:
                print("failed")
            case .unknown:
                print("unknown")
            @unknown default:
                print("unknown default")
            }
        }
    }
}
