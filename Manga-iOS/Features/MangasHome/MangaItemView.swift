//
//  MangaItemView.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 19/02/26.
//

import SwiftUI

struct MangaItemView: View {
    var manga: Manga
    var isFavorite: Bool
    var showFavoriteButton: Bool = true
    var onFavoriteTapped: () -> Void

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: manga.mainPicture.replacingOccurrences(of: "\"", with: ""))!) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            } placeholder: { }

            VStack(alignment: .leading, spacing: 8) {
                Text(manga.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)

                if showFavoriteButton {
                    Button(action: onFavoriteTapped) {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .foregroundColor(isFavorite ? .yellow : .gray)
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.leading, 8)
        }
    }
}
