//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI

enum PipStatus: CustomStringConvertible {
    case willStart, didStart, willStop, didStop, undefined
    
    var description: String {
        switch self {
        case .willStart: return "PiP will start"
        case .didStart: return "PiP did start"
        case .willStop: return "PiP will stop"
        case .didStop: return "PiP did stop"
        case .undefined: return "PiP status is undefined"
        }
    }
    
    var color: Color {
        switch self {
        case .willStart: return .yellow
        case .didStart: return .green
        case .willStop: return .pink
        case .didStop: return .red
        case .undefined: return .gray
        }
    }
}
