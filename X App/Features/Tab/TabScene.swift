import SwiftUI

struct TabScene<Content: View, Items: RandomAccessCollection>: View where Items.Element: Identifiable & Hashable & IconsProviding {

    // MARK: - dependencies

    private let content: (Items.Element) -> Content
    private let items: Items

    @ObservedObject private var viewModel: TabViewModel
    private var localizer: any TabLocalizing { viewModel.localizer }

    // MARK: - Props

    @Binding private var selectedTab: Items.Element

    // MARK: - init

    init(
        items: Items,
        selectedTab: Binding<Items.Element>,
        @ViewBuilder content: @escaping(Items.Element) -> Content,
        viewModel: TabViewModel
    ) {
        self.content = content
        _selectedTab = selectedTab
        self.items = items
        self.viewModel = viewModel
    }

    // MARK: - body

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            selectedProperty
            DynamicTabV2(items: items, selectedTab: $selectedTab) { item in
                item.icon
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
            }
            .padding(.init(top: 0, leading: 0, bottom: 20, trailing: 20))
        }
    }

    private var selectedProperty: some View {
        content(selectedTab)
    }
}
