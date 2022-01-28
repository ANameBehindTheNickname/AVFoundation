//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import UIKit
import AVFoundation

final class PlayerView: UIView {

    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }
    
    var player: AVPlayer? {
        get { playerLayer.player }
        set { playerLayer.player = newValue }
    }
    
    private var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }
}
