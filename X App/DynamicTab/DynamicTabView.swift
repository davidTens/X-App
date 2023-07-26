import SwiftUI
import OSLog

enum TabState {
    case collapsed
    case expanded
}

struct DynamicTabBar<Content: View, Items: RandomAccessCollection>: View where Items.Element: Identifiable & Hashable {

    private let content: (Items.Element) -> Content
    private let items: Items

    @State private var tabState: TabState = .collapsed
    @Binding private(set) var selectedTab: Items.Element

    init(
        items: Items,
        selectedTab: Binding<Items.Element>,
        @ViewBuilder content: @escaping(Items.Element) -> Content
    ) {
        self.content = content
        _selectedTab = selectedTab
        self.items = items
    }

    var body: some View {
        GeometryReader { geometry in
            LazyVStack(spacing: 0) {
                ForEach(items) { item in
                    tabItems(item)
                }
            }
            .frame(width: 70, height: geometry.size.height)
        }
        .frame(width: 70, height: tabState == .collapsed ? 70 : 200)
        .background(RoundedRectangle(cornerRadius: tabState == .collapsed ? 35 : 5).foregroundColor(.gray))
        .clipShape(RoundedRectangle(cornerRadius: tabState == .collapsed ? 35 : 5))
    }

    private func tabItems(_ item: Items.Element) -> some View {
        content(item)
            .foregroundStyle(
                selectedTab == item ? Color("TabTintColor") : .init(white: 0.6)
            )
            .opacity(
                tabState == .collapsed ? selectedTab == item ? 1.0 : 0.0 : 1.0
            )
            .padding(
                EdgeInsets(
                    top: tabState == .collapsed ? -12 : 10,
                    leading: 0,
                    bottom: tabState == .collapsed ? -12 : 6,
                    trailing: 0
                )
            )
            .onTapGesture {
                withAnimation(
                    .interpolatingSpring(
                        stiffness: 300,
                        damping: 15
                    )
                ) {
                    selectedTab = item
                    print(item.id)

                    switch tabState {
                    case .collapsed:
                        tabState = .expanded
                    case .expanded:
                        tabState = .collapsed
                    }
                }
            }
            .onLongPressGesture {
                print("[TabScene] \(item.id)" )
            }
        
    }
}
