import Foundation
import SwiftUI

struct Chat: Identifiable, Hashable {
    let id = UUID()
    var contactName: String
    var lastMessage: String
    var lastMessageTime: String
    var contactImages: [String]
    var isMuted: Bool = false
    
    var isGroupChat: Bool {
        contactImages.count > 1
    }
} 