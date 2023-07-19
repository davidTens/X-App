//
//  TabViewModel.swift
//  X App
//
//  Created by David on 7/19/23.
//

import Combine
import OSLog
import Foundation

final class TabViewModel: ObservableObject {

    // MARK: - dependencies

    private let localier: TabLocalizing

    // MARK: - input

    private var cancellables = [AnyCancellable]()
    lazy var didSingleTap = PassthroughSubject<TabItems, Never>()

    // MARK: - init

    init(
        localier: TabLocalizing
    ) {
        self.localier = localier

        setupBindings()
    }

    private func setupBindings() {
        didSingleTap
            .sink(receiveValue:  { item in
                Logger().debug(
                    "::[TabViewModel] \(item.rawValue) tapped"
                )
            })
            .store(in: &cancellables)
    }
}
