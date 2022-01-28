//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI
import AVKit

@main
struct AVKitPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    try? AVAudioSession.sharedInstance().setCategory(.playback)
                }
        }
    }
}
