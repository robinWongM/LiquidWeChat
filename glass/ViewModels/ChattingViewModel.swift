import Foundation
import Combine

class ChattingViewModel: ObservableObject {
    @Published var messages: [Message] = []
    
    init() {
        // Load initial messages with some variety
        messages = [
            Message(text: "Hey, how's it going?", isFromCurrentUser: false, timestamp: Date().addingTimeInterval(-300)),
            Message(text: "Not bad, just chilling. You?", isFromCurrentUser: true, timestamp: Date().addingTimeInterval(-240)),
            Message(text: "Same here. Wanna grab a coffee later? I'm free this afternoon.", isFromCurrentUser: false, timestamp: Date().addingTimeInterval(-180)),
            Message(text: "Sure, sounds good! Where should we meet?", isFromCurrentUser: true, timestamp: Date().addingTimeInterval(-120)),
            Message(text: "How about the usual spot? Around 3 PM?", isFromCurrentUser: false, timestamp: Date().addingTimeInterval(-60)),
        ]
    }
    
    func sendMessage(_ text: String) {
        let newMessage = Message(text: text, isFromCurrentUser: true, timestamp: Date())
        messages.append(newMessage)
        
        // Simulate a reply after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let reply = Message(text: "Sounds great! See you then.", isFromCurrentUser: false, timestamp: Date())
            self.messages.append(reply)
        }
    }
} 