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

    // MARK: - init

    init(
        viewModel: TabViewModel
    ) {
        self.viewModel = viewModel
    }

    // MARK: - body

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onTapGesture {
                    viewModel.didSingleTap.send(.feed)
                }
        }
        .padding()
    }
}

struct TabScene_Previews: PreviewProvider {
    static var previews: some View {
        let tabViewModel = TabViewModel(
            localier: DefaultTabLocalizer()
        )
        TabScene(viewModel: tabViewModel)
    }
}
