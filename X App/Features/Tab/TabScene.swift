import SwiftUI

struct TabScene: View {

    // MARK: - dependencies

    @ObservedObject private var viewModel: TabViewModel
    private var localizer: any TabLocalizing { viewModel.localizer }

    // MARK: - Props

    @State private var selectedTab: TabItems = .home

    // MARK: - init

    init(
        viewModel: TabViewModel
    ) {
        self.viewModel = viewModel
    }

    // MARK: - body

    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack {
                Text(localizer.title)
                    .font(.init(.custom("Avenir Next", size: 50)))
                    .padding(.init(top: 130, leading: 50, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                DynamicTabView(
                    selectedTab: $selectedTab
                ) { item in
                    viewModel.didSingleTap.send(item)
                }
            }
        }
    }
}

struct TabScene_Previews: PreviewProvider {
    static var previews: some View {

        // TODO: replace with mocks

        let tabViewModel = TabViewModel(
            localizer: DefaultTabLocalizer()
        )
        TabScene(viewModel: tabViewModel)
    }
}
