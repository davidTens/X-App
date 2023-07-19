//
//  X_AppApp.swift
//  X App
//
//  Created by David on 7/19/23.
//

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
