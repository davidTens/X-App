import Foundation

final class DefaultTabLocalizer: TabLocalizing {
    private let table = "Tab"
    var title: String { .init(localized: "TAB_TITLE", table: table) }
}
