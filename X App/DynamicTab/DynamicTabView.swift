import SwiftUI

enum TabState {
    case collapsed
    case expanded
}

struct DynamicTabView: View {

    @State private var tabState: TabState = .collapsed
    @Binding private(set) var selectedTab: TabItems

    var body: some View {
        VStack {
            HStack {
                Spacer()
                tabView()
            }
            .padding(
                EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 16,
                    trailing: 25
                )
            )
        }
    }

    private func tabView() -> some View {
        Rectangle()
            .overlay {
                GeometryReader { geometry in
                    LazyVStack(spacing: 0) {
                        ForEach(TabItems.allCases, id: \.rawValue) { item in
                            tabItemView(item)
                                .padding(
                                    EdgeInsets(
                                        top: tabState == .collapsed ? -12 : 10,
                                        leading: 0,
                                        bottom: tabState == .collapsed ? -12 : 6,
                                        trailing: 0
                                    )
                                )
                        }
                    }
                    .frame(width: 70, height: geometry.size.height)
                }
            }
            .foregroundColor(Color("TabColor"))
            .frame(width: 70, height: tabState == .collapsed ? 70 : 200)
            .cornerRadius(tabState == .collapsed ? 35 : 5)
    }

    private func tabItemView(_ item: TabItems) -> some View {
        Image(item.rawValue)
            .resizable()
            .renderingMode(.template)
            .frame(width: 25, height: 25)
            .foregroundColor(
                selectedTab == item ? Color("TabTintColor") : .init(white: 0.6)
            )
            .opacity(
                tabState == .collapsed ? selectedTab == item ? 1.0 : 0.0 : 1.0
            )
            .onTapGesture {
                withAnimation(
                    .interpolatingSpring(
                        stiffness: 300,
                        damping: 15
                    )
                ) {
                    selectedTab = item

                    switch tabState {
                    case .collapsed:
                        tabState = .expanded
                    case .expanded:
                        tabState = .collapsed
                    }
                }
            }
    }
}
