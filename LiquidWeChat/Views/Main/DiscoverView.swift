import SwiftUI

struct DiscoverView: View {
    var body: some View {
        List {
            Section {
                Label("Moments", systemImage: "circle.grid.2x2.fill")
            }
            Section {
                Label("Scan", systemImage: "qrcode.viewfinder")
            }
            Section {
                Label("Top Stories", systemImage: "newspaper.fill")
            }
        }
        .navigationTitle("Discover")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
} 
