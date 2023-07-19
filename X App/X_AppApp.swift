import SwiftUI

@main
struct X_AppApp: App {
    var body: some Scene {
        WindowGroup {
            let tabViewModel = TabViewModel(
                localizer: DefaultTabLocalizer()
            )
            TabScene(viewModel: tabViewModel)
        }
    }
}
