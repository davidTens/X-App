import SwiftUI

@main
struct X_AppApp: App {

    @State private var selectedTab: TabItems = .home

    var body: some Scene {
        WindowGroup {
            TabScene(items: TabItems.allCases, selectedTab: $selectedTab, content: { feature in
                switch feature {
                case .home:
                    NavigationStack {
                        HomeScene()
                    }
                case .feed:
                    NavigationStack {
                        FeedScene()
                    }
                case .chat:
                    NavigationStack {
                        ChatScene()
                    }
                case .profile:
                    ProfileFeed()
                }
            }, viewModel: TabViewModel(localizer: DefaultTabLocalizer()))
        }
    }
}
