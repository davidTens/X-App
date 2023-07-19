import Combine
import OSLog
import Foundation

final class TabViewModel: ObservableObject {

    // MARK: - dependencies

    let localizer: any TabLocalizing

    // MARK: - input

    private var cancellables = [AnyCancellable]()
    lazy var didSingleTap = PassthroughSubject<TabItems, Never>()
    lazy var didLongPressTap = PassthroughSubject<TabItems, Never>()

    // MARK: - init

    init(
        localizer: TabLocalizing
    ) {
        self.localizer = localizer

        setupBindings()
    }

    private func setupBindings() {
        // the event must be sent to coordinator
        // coordinator should be responsible to draw corresponding view
        // in the tab coordinator make sure the object is subscribed to *didSingleTap* ^^
        // so it will be able to recieve events and act accordingly

        didSingleTap
            .sink(receiveValue:  { item in
                Logger().debug(
                    "::[TabViewModel] \(item.rawValue) tapped"
                )
            })
            .store(in: &cancellables)

        didLongPressTap
            .sink(receiveValue: { item in })
            .store(in: &cancellables)
    }
}
