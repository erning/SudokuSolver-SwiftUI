import SwiftUI

// https://fivestars.blog/swiftui/conditional-modifiers.html
extension View {
    @ViewBuilder
    func `if`<T: View>(_ condition: Bool, transform: (Self) -> T) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func `if`<T: View, U: View>(
        _ condition: Bool, if ifTransform: (Self) -> T, else elseTransform: (Self) -> U
    ) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
}
