//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let player: AVPlayer
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear(perform: player.play)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(player: .init())
    }
}
