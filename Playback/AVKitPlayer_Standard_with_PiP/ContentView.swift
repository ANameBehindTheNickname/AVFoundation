//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    private let player: AVPlayer = {
        let url = Bundle.main.url(forResource: "Charlie The Unicorn", withExtension: "m4v")!
        return AVPlayer(url: url)
    }()
    
    @State private var pipStatus = PipStatus.undefined
    
    var body: some View {
        VStack {
            Text(pipStatus.description)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(pipStatus.color)
            
            VideoPlayerController(player: player, pipStatus: $pipStatus)
        }
        .onAppear(perform: player.play)
        .onDisappear(perform: player.pause)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
