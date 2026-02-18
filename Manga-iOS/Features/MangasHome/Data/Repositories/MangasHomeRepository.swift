//
//  MangasHomeRepository.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 18/02/26.
//

import Foundation

protocol MangasHomeRepositoryProtocol {
    func getMangas() async throws(NetworkError) -> [Manga]
}

struct MangasHomeRepository: MangasHomeRepositoryProtocol, NetworkManager {
    let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getMangas() async throws(NetworkError) -> [Manga] {
        try await getJSON(
            .get(.getMangas),
            type: [MangaDTO].self
        )
        .compactMap(\.toManga)
    }
}
