//
//  MangasHomeFactory.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 19/02/26.
//

import SwiftUI

enum MangasHomeFactory {

    static func getMangasHomeView() -> some View {
        let repository = MangasHomeRepository()
        let viewModel = MangasHomeViewModel(repository: repository)
        return MangasHomeView(viewModel: viewModel)
    }
}
