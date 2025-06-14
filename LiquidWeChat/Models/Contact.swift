import Foundation

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String // For now, we can use SF Symbols name
} 