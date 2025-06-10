import SwiftUI

struct MeView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.secondary)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Your Name")
                            .font(.title)
                        Text("WeChat ID: your_id")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical)
            }
            
            Section {
                Label("Favorites", systemImage: "star.fill")
                Label("My Posts", systemImage: "photo.on.rectangle.angled")
                Label("Sticker Gallery", systemImage: "face.smiling.fill")
            }
            
            Section {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Me")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
} 