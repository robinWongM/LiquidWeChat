import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        Text("Searching for \(searchText)")
            .searchable(text: $searchText)
            .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
} 
