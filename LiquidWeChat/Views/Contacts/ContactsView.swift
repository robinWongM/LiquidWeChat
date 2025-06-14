import SwiftUI

struct ContactsView: View {
    @State private var searchText = ""

    let contacts: [Contact] = [
        Contact(name: "Alice", avatar: "person.fill"),
        Contact(name: "Bob", avatar: "person.fill"),
        Contact(name: "Charlie", avatar: "person.fill"),
        Contact(name: "David", avatar: "person.fill"),
        Contact(name: "Emily", avatar: "person.fill"),
        Contact(name: "Frank", avatar: "person.fill"),
        Contact(name: "Grace", avatar: "person.fill"),
        Contact(name: "Hannah", avatar: "person.fill"),
        Contact(name: "Ivy", avatar: "person.fill"),
        Contact(name: "Jack", avatar: "person.fill"),
        Contact(name: "Zoe", avatar: "person.fill"),
    ]

    var body: some View {
        List {
            Section {
                ContactRow(imageName: "person.crop.circle.badge.plus", text: "New Friends")
                ContactRow(imageName: "person.3.sequence.fill", text: "Group Chats")
                ContactRow(imageName: "tag.square.fill", text: "Tags")
                ContactRow(imageName: "bubble.right.circle.fill", text: "Official Accounts")
            }

            ForEach(groupedContacts.keys.sorted(), id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(groupedContacts[key]!) { contact in
                        ContactRow(imageName: contact.avatar, text: contact.name)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
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
    
    private var groupedContacts: [String: [Contact]] {
        let filteredContacts = contacts.filter { contact in
            searchText.isEmpty || contact.name.localizedCaseInsensitiveContains(searchText)
        }
        
        return Dictionary(grouping: filteredContacts) { contact in
            String(contact.name.prefix(1)).uppercased()
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
} 
