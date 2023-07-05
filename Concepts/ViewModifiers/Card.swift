import SwiftUI

// view modifier
struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}

// view extension for better modifier access
extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}
