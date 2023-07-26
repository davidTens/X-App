import Foundation
import SwiftUI

enum TabItems: String, CaseIterable, Identifiable, IconsProviding {
    var id: Self { return self }
    case home
    case feed
    case chat
    case profile

    var icon: Image {
        Image(self.rawValue)
    }
}
