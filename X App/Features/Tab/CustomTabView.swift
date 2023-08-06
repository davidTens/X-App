import SwiftUI
import OSLog

//struct DynamicTab<Content: View, Items: RandomAccessCollection>: View where Items.Element: Identifiable & Hashable {
//
//    private let content: (Items.Element) -> Content
//    private let items: Items
//
//    @State private var tabState: TabState = .collapsed
//    @Binding private(set) var selectedTab: Items.Element
//
//    init(
//        items: Items,
//        selectedTab: Binding<Items.Element>,
//        @ViewBuilder content: @escaping(Items.Element) -> Content
//    ) {
//        self.content = content
//        _selectedTab = selectedTab
//        self.items = items
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            LazyVStack(spacing: 0) {
//                ForEach(items) { item in
//                    tabItems(item)
//                }
//            }
//            .frame(width: 70, height: geometry.size.height)
//        }
//        .frame(width: 70, height: tabState == .collapsed ? 70 : 200)
//        .background(RoundedRectangle(cornerRadius: tabState == .collapsed ? 35 : 5).foregroundColor(.gray))
//        .clipShape(RoundedRectangle(cornerRadius: tabState == .collapsed ? 35 : 5))
//    }
//
//    private func tabItems(_ item: Items.Element) -> some View {
//        content(item)
//            .foregroundStyle(
//                selectedTab == item ? Color("TabTintColor") : .init(white: 0.6)
//            )
//            .opacity(
//                tabState == .collapsed ? selectedTab == item ? 1.0 : 0.0 : 1.0
//            )
//            .padding(
//                EdgeInsets(
//                    top: tabState == .collapsed ? -12 : 10,
//                    leading: 0,
//                    bottom: tabState == .collapsed ? -12 : 6,
//                    trailing: 0
//                )
//            )
//            .onTapGesture {
//                withAnimation(
//                    .interpolatingSpring(
//                        stiffness: 300,
//                        damping: 15
//                    )
//                ) {
//                    selectedTab = item
//                    print(item.id)
//
//                    switch tabState {
//                    case .collapsed:
//                        tabState = .expanded
//                    case .expanded:
//                        tabState = .collapsed
//                    }
//                }
//            }
//            .onLongPressGesture {
//                print("[TabScene] \(item.id)" )
//            }
//
//    }
//}
//
//struct DynamicTabV2_Previews: PreviewProvider {
//
//    private struct BlahView: View {
//        @State private var selectedTab: TabItems = .home
//        var body: some View {
//            CustomTabView(items: TabItems.allCases, selectedTab: $selectedTab) { item in
//                switch item {
//                case .home:
//                    NavigationStack {
//                        HomeScene()
//                            .navigationTitle("home")
//                            .navigationBarTitleDisplayMode(.inline)
//                    }
//                case .feed:
//                    NavigationStack {
//                        FeedScene()
//                    }
//                case .chat:
//                    ChatScene()
//                case .profile:
//                    ProfileFeed()
//                }
//            }
//        }
//    }
//    static var previews: some View {
//        BlahView()
//    }
//}
//
//
//struct CustomTabView<Content: View, Items: RandomAccessCollection>: View where Items.Element: Identifiable & Hashable & IconsProviding {
//
//    @Binding private var selectedTab: Items.Element
//
//    private let content: (Items.Element) -> Content
//    private let items: Items
//
//
//    init(
//        items: Items,
//        selectedTab: Binding<Items.Element>,
//        @ViewBuilder content: @escaping(Items.Element) -> Content
//    ) {
//        self.content = content
//        _selectedTab = selectedTab
//        self.items = items
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            selectedProperty
//            DynamicTab(items: items, selectedTab: $selectedTab) { item in
//                item.icon
//                    .resizable()
//                    .renderingMode(.template)
//                    .scaledToFit()
//                    .frame(width: 25, height: 25)
//            }
//            .padding(.init(top: 0, leading: 0, bottom: 20, trailing: 20))
//        }
//    }
//
//    var selectedProperty: some View {
//        content(selectedTab)
//    }
//}


