import SwiftUI

struct AvatarView: View {
    let images: [String]
    let size: CGFloat

    var body: some View {
        if images.count == 1 {
            if let url = URL(string: images[0]) {
                CachedAsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color(white: 0.9)
                }
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            }
        } else {
            let spacing: CGFloat = 2
            let imageSize = (size - spacing) / 2
            
            ZStack {
                Color(white: 0.85)
                
                VStack(spacing: spacing) {
                    HStack(spacing: spacing) {
                        if let url = URL(string: images[0]) {
                            CachedAsyncImage(url: url) { image in
                                image.resizable().aspectRatio(contentMode: .fill)
                            } placeholder: { Color(white: 0.9) }
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                        }
                        if let url = URL(string: images[1]) {
                            CachedAsyncImage(url: url) { image in
                                image.resizable().aspectRatio(contentMode: .fill)
                            } placeholder: { Color(white: 0.9) }
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                        }
                    }
                    HStack(spacing: spacing) {
                        if images.count > 2, let url = URL(string: images[2]) {
                            CachedAsyncImage(url: url) { image in
                                image.resizable().aspectRatio(contentMode: .fill)
                            } placeholder: { Color(white: 0.9) }
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                        }
                        if images.count > 3, let url = URL(string: images[3]) {
                            CachedAsyncImage(url: url) { image in
                                image.resizable().aspectRatio(contentMode: .fill)
                            } placeholder: { Color(white: 0.9) }
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                        }
                    }
                }
            }
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
} 