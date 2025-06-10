import Foundation
import Combine

class ChatsViewModel: ObservableObject {
    @Published var chats: [Chat] = [
        Chat(contactName: "Family", lastMessage: "Becky: [Sticker]", lastMessageTime: "16:24", contactImages: (1...4).map { "https://picsum.photos/seed/family\($0)/50" }),
        Chat(contactName: "Chris", lastMessage: "Here yet? I'm already here.", lastMessageTime: "Yesterday 10:32", contactImages: ["https://picsum.photos/seed/chris/50"], isMuted: true),
        Chat(contactName: "Chloe", lastMessage: "OMG. Let's do it!", lastMessageTime: "19:21", contactImages: ["https://picsum.photos/seed/chloe/50"]),
        Chat(contactName: "Anna", lastMessage: "Hahahahahaha!", lastMessageTime: "16:56", contactImages: ["https://picsum.photos/seed/anna/50"]),
        Chat(contactName: "Hanging Out", lastMessage: "Anna: [Audio] 8\"", lastMessageTime: "15:24", contactImages: (1...4).map { "https://picsum.photos/seed/hangingout\($0)/50" }, isMuted: true),
        Chat(contactName: "James", lastMessage: "I sent you my vacation video. Check it ...", lastMessageTime: "14:06", contactImages: ["https://picsum.photos/seed/james/50"]),
        Chat(contactName: "Flora", lastMessage: "[Photo]", lastMessageTime: "13:36", contactImages: ["https://picsum.photos/seed/flora/50"]),
        Chat(contactName: "Leo", lastMessage: "Where should we go?", lastMessageTime: "12:45", contactImages: ["https://picsum.photos/seed/leo/50"], isMuted: true),
        Chat(contactName: "Andy", lastMessage: "hi~", lastMessageTime: "13:36", contactImages: ["https://picsum.photos/seed/andy/50"]),
        Chat(contactName: "Olivia", lastMessage: "See you later!", lastMessageTime: "11:55", contactImages: ["https://picsum.photos/seed/olivia/50"]),
        Chat(contactName: "Ethan", lastMessage: "Let's catch up soon.", lastMessageTime: "11:30", contactImages: ["https://picsum.photos/seed/ethan/50"], isMuted: true),
        Chat(contactName: "Sophia", lastMessage: "I'm running late, sorry!", lastMessageTime: "11:15", contactImages: ["https://picsum.photos/seed/sophia/50"]),
        Chat(contactName: "Liam", lastMessage: "Can you send me the file?", lastMessageTime: "10:50", contactImages: ["https://picsum.photos/seed/liam/50"]),
        Chat(contactName: "Ava", lastMessage: "Happy Birthday!", lastMessageTime: "10:20", contactImages: ["https://picsum.photos/seed/ava/50"]),
        Chat(contactName: "Noah", lastMessage: "[Voice Message]", lastMessageTime: "09:45", contactImages: ["https://picsum.photos/seed/noah/50"], isMuted: true),
        Chat(contactName: "Isabella", lastMessage: "Just woke up.", lastMessageTime: "09:12", contactImages: ["https://picsum.photos/seed/isabella/50"]),
        Chat(contactName: "Lucas", lastMessage: "Good morning!", lastMessageTime: "08:30", contactImages: ["https://picsum.photos/seed/lucas/50"]),
        Chat(contactName: "Mia", lastMessage: "Thanks for yesterday!", lastMessageTime: "Yesterday", contactImages: ["https://picsum.photos/seed/mia/50"]),
        Chat(contactName: "Work Group", lastMessage: "Meeting at 10 AM.", lastMessageTime: "Yesterday", contactImages: (1...4).map { "https://picsum.photos/seed/work\($0)/50" }),
        Chat(contactName: "Benjamin", lastMessage: "Let's do this!", lastMessageTime: "Yesterday", contactImages: ["https://picsum.photos/seed/benjamin/50"]),
        Chat(contactName: "Amelia", lastMessage: "Are you free this weekend?", lastMessageTime: "Yesterday", contactImages: ["https://picsum.photos/seed/amelia/50"]),
        Chat(contactName: "Henry", lastMessage: "Project update?", lastMessageTime: "2 days ago", contactImages: ["https://picsum.photos/seed/henry/50"]),
        Chat(contactName: "Evelyn", lastMessage: "On my way.", lastMessageTime: "2 days ago", contactImages: ["https://picsum.photos/seed/evelyn/50"], isMuted: true),
        Chat(contactName: "Alexander", lastMessage: "Got it, thanks!", lastMessageTime: "2 days ago", contactImages: ["https://picsum.photos/seed/alexander/50"]),
        Chat(contactName: "Harper", lastMessage: "Dinner tonight?", lastMessageTime: "3 days ago", contactImages: ["https://picsum.photos/seed/harper/50"]),
        Chat(contactName: "Sebastian", lastMessage: "How have you been?", lastMessageTime: "3 days ago", contactImages: ["https://picsum.photos/seed/sebastian/50"]),
        Chat(contactName: "Grace", lastMessage: "[Sticker]", lastMessageTime: "4 days ago", contactImages: ["https://picsum.photos/seed/grace/50"]),
        Chat(contactName: "Jack", lastMessage: "Call me when you're free.", lastMessageTime: "4 days ago", contactImages: ["https://picsum.photos/seed/jack/50"])
    ]
} 
