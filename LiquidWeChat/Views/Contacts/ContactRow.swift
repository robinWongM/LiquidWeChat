import SwiftUI

struct ContactRow: View {
    let imageName: String
    let text: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .padding(8)
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
            Text(text)
                .padding(.horizontal, 8.0)
            Spacer()
        }
        .contentShape(Rectangle())
    }
} 
