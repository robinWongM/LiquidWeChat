import SwiftUI

struct ChatsView: View {
    @StateObject private var viewModel = ChatsViewModel()
    @State private var searchText = ""

    var body: some View {
        ZStack {
            
            List {
                ForEach(viewModel.chats.indices, id: \.self) { index in
                    let chat = viewModel.chats[index]
                    ZStack {
                        // Use value-based NavigationLink so we can observe the path in the parent NavigationStack.
                        NavigationLink(value: chat) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        ChatRow(chat: chat)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .listRowSeparator(.hidden, edges: index == 0 ? .top : (index == viewModel.chats.count - 1 ? .bottom : []))
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("WeChat")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            // Handle group chat action
                        }) {
                            Label("New Chat", systemImage: "person.2")
                        }
                        
                        Button(action: {
                            // Handle add friend action
                        }) {
                            Label("Add Contacts", systemImage: "person.badge.plus")
                        }
                        
                        Button(action: {
                            // Handle scan action
                        }) {
                            Label("Scan", systemImage: "qrcode.viewfinder")
                        }
                        
                        Button(action: {
                            // Handle payment action
                        }) {
                            Label("Money", systemImage: "arrow.left.arrow.right")
                        }
                    } label: {
                        Label("more", systemImage: "plus")
                    }
                }
            }
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
} 
