//
//  TabScene.swift
//  X App
//
//  Created by David on 7/19/23.
//

import SwiftUI

struct TabScene: View {

    // MARK: - dependencies

    @ObservedObject private var viewModel: TabViewModel
    private var localizer: any TabLocalizing { viewModel.localizer }

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
                Text("X app")
                    .font(.init(.custom("Avenir Next", size: 50)))
                    .padding(.init(top: 130, leading: 50, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                DynamicTabView(selectedTab: .constant(.home))
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
