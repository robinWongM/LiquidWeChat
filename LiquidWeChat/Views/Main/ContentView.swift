//
//  ContentView.swift
//  glass
//
//  Created by Robin Wong on 2025/6/10.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    // Controls tab bar visibility
    @State private var showTabBar = true
    // Navigation path for Chats tab
    @State private var chatPath: [Chat] = []
    
    var body: some View {
        TabView {
            Tab("Chats", systemImage: "message.fill") {
                NavigationStack(path: $chatPath) {
                    ChatsView()
                        // Respond to navigation stack depth changes to animate tab bar visibility
                        .onChange(of: chatPath) { newValue in
                            withAnimation {
                                showTabBar = newValue.isEmpty
                            }
                        }
                        // Define destination for Chat objects pushed via value-based NavigationLink
                        .navigationDestination(for: Chat.self) { chat in
                            ChattingView(chat: chat)
                        }
                        
                }
                .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
            }
            
            Tab("Contacts", systemImage: "person.2.fill") {
                NavigationStack {
                    ContactsView()
                }
            }
            
            Tab("Discover", systemImage: "safari.fill") {
                NavigationStack {
                    DiscoverView()
                }
            }
            
            Tab("Me", systemImage: "person.fill") {
                NavigationStack {
                    MeView()
                }
            }
            Tab(role: .search) {
                NavigationStack {
                    SearchView()
                }
            }
        }
        // .tabBarMinimizeBehavior(.onScrollDown)
        .accentColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

