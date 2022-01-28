//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI
import AVFoundation

@main
struct Custom_Player_with_PiPApp: App {
    private let player = AVPlayer()
    
    var body: some Scene {
        configurePlayer()
        
        return WindowGroup {
            ContentView(player: player)
        }
    }
    
    private func configurePlayer() {
        let url = Bundle.main.url(forResource: "video", withExtension: "mp4")!
        let asset = AVURLAsset(url: url)
        let keysRequiredForPlayback = ["playable", "hasProtectedContent"]
        
        asset.loadValuesAsynchronously(forKeys: keysRequiredForPlayback) {
            if validate(keys: keysRequiredForPlayback, for: asset) {
                player.replaceCurrentItem(with: .init(asset: asset))
            }
        }
    }
    
    private func validate(keys: [String], for asset: AVAsset) -> Bool {
        let statuses = keys.map {
            asset.statusOfValue(forKey: $0, error: nil)
        }
        
        return !statuses.contains(.failed) && asset.isPlayable && !asset.hasProtectedContent
    }
}
