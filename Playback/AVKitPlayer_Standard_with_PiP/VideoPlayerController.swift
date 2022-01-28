//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoPlayerController: UIViewControllerRepresentable {
    private let player: AVPlayer
    @Binding private var pipStatus: PipStatus
    
    init(player: AVPlayer, pipStatus: Binding<PipStatus>) {
        self.player = player
        self._pipStatus = pipStatus
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let avPlayerVC = AVPlayerViewController()
        avPlayerVC.player = player
        
        avPlayerVC.delegate = context.coordinator
        
        return avPlayerVC
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        .init(self)
    }
    
    class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        private let parent: VideoPlayerController
        
        init(_ parent: VideoPlayerController) {
            self.parent = parent
        }
        
        func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.pipStatus = .willStart
        }
        
        func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.pipStatus = .didStart
        }
        
        func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.pipStatus = .willStop
        }
        
        func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.pipStatus = .didStop
        }
    }
}
