//
//  MangasHomeView.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 18/02/26.
//

import SwiftUI

struct MangasHomeView: View {
    @State private var viewModel: MangasHomeViewModel
    
    init(viewModel: MangasHomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading: loadingView
        case .loaded: MangasListView(viewModel: viewModel)
        case .failed(let error): Text("Error: \(error)")
        }
    }
}

private extension MangasHomeView {
    
    var loadingView: some View {
        ProgressView()
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .task { await viewModel.loadMangas() }
    }
}

#Preview {
    MangasHomeFactory.getMangasHomeView()
}
