import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    private let cache = ImageCache.shared

    init(url: URL) {
        self.url = url
    }

    deinit {
        cancel()
    }

    func load() {
        if let cachedImage = cache.get(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveOutput: { [weak self] image in
                guard let self = self, let image = image else { return }
                self.cache.set(image, forKey: self.url.absoluteString)
            })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    func cancel() {
        cancellable?.cancel()
    }
} 