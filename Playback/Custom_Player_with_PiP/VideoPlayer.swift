//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI
import AVFoundation

struct VideoPlayer: UIViewRepresentable {
    let player: AVPlayer
    
    func makeUIView(context: Context) -> PlayerView {
        let view = PlayerView()
        view.player = player
        return view
    }
    
    func updateUIView(_ uiView: PlayerView, context: Context) { }
}
