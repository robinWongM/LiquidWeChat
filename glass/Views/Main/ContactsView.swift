import SwiftUI

struct ContactsView: View {
    var body: some View {
        List {
            Text("Alice")
            Text("Bob")
            Text("Charlie")
        }
        .navigationTitle("Contacts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Add contact action
                }) {
                    Image(systemName: "person.badge.plus")
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
} 