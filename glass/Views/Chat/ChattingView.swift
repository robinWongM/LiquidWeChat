import SwiftUI
import Combine
import UIKit

struct ChattingView: View {
    let chat: Chat
    @StateObject private var viewModel = ChattingViewModel()
    @State private var newMessageText = ""
    @State private var keyboardHeight: CGFloat = 0

    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.messages) { message in
                            MessageView(message: message)
                                .id(message.id)
                        }
                        
                        // Invisible spacer to ensure proper scrolling to bottom
                        Spacer()
                            .frame(height: 0)
                            .id("bottom")
                    }
                    .padding()
                }
                .scrollDismissesKeyboard(.interactively)
                .onChange(of: viewModel.messages.count) { _ in
                    withAnimation {
                        scrollView.scrollTo("bottom", anchor: .top)
                    }
                }
                .onChange(of: keyboardHeight) { _ in
                    // Scroll to bottom when keyboard appears/disappears
                    if keyboardHeight > 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                scrollView.scrollTo("bottom", anchor: .bottom)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        UIKitTextField(text: $newMessageText, placeholder: "Tap here to start typing...") {
                            sendMessage()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                    }
                    
                    ToolbarSpacer(.fixed, placement: .bottomBar)
                    
                    if newMessageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        ToolbarItem(placement: .bottomBar) {
                            Button("More", systemImage: "plus") {
                                showMoreOptions()
                            }
                        }
                    } else {
                        ToolbarItem(placement: .bottomBar) {
                            Button("Send", systemImage: "paperplane") {
                                sendMessage()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(chat.contactName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("More", systemImage: "ellipsis") {
                    showMoreOptions()
                }
            }
        }
        .onReceive(Publishers.keyboardHeight) { height in
            withAnimation(.easeInOut(duration: 0.3)) {
                keyboardHeight = height
            }
        }
        // Tab bar visibility is now controlled by the root view based on navigation stack depth
    }
    
    private func sendMessage() {
        let trimmedText = newMessageText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }
        
        viewModel.sendMessage(trimmedText)
        newMessageText = ""
    }
    
    private func showMoreOptions() {
        // Handle more options action
        print("More options tapped")
    }
}

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .padding(12)
                    .background(.tint.opacity(0.8))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            } else {
                Text(message.text)
                    .padding(12)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                Spacer()
            }
        }
    }
}

// MARK: - Keyboard Height Publisher
extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { notification -> CGFloat in
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
            }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ -> CGFloat in 0 }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

// MARK: - UIKitTextField Wrapper
struct UIKitTextField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var onReturn: () -> Void = {}

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: UIKitTextField

        init(_ parent: UIKitTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onReturn()
            textField.text = ""
            parent.text = ""
            textField.resignFirstResponder()
            return true
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.returnKeyType = .send
        textField.autocorrectionType = .yes
        textField.autocapitalizationType = .sentences
        textField.borderStyle = .roundedRect
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }
}
