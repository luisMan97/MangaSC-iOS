//
//  MangasListView.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 19/02/26.
//

import SwiftUI

struct MangasListView: View {
    @Bindable var viewModel: MangasHomeViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.mangas) { manga in
                NavigationLink(value: manga) {
                    MangaItemView(
                        manga: manga,
                        isFavorite: true/*viewModel.isFavorite(
                            manga,
                            favorites: favorites
                        )*/,
                        onFavoriteTapped: {
                            /*viewModel.toggleFavorite(
                                manga,
                                favorites: favorites
                            )*/
                        }
                    )
                }
            }
            .navigationTitle("Mangas")
            .navigationDestination(for: Manga.self) { manga in
                //EditManga(manga: manga)
            }
        }
        .refreshable {
            await viewModel.loadMangas()
        }
    }
}

#Preview {
    @Previewable @State var vm = MangasHomeViewModel(repository: MangasHomeRepository())
    MangasListView(viewModel: vm)
}
