import SwiftUI

struct ChatRow: View {
    let chat: Chat

    var body: some View {
        HStack(spacing: 12) {
            AvatarView(images: chat.contactImages, size: 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(chat.contactName)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.primary)

                Text(chat.lastMessage)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 7) {
                Text(chat.lastMessageTime)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                
                if chat.isMuted {
                    Image(systemName: "bell.slash.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                } else {
                    Spacer().frame(height: 12)
                }
            }
        }
        .padding(.vertical, 12)
    }
} 
