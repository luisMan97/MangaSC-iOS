//
//  MangasHomeViewModel.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 18/02/26.
//

import Foundation

enum MangasHomeViewState: Sendable {
    case loading
    case loaded
    case failed(String)
}

@Observable
final class MangasHomeViewModel {
    var mangas: [Manga] = []
    var showError = false
    var errorMessage = ""
    var state: MangasHomeViewState = .loading
    
    private let repository: MangasHomeRepositoryProtocol
    
    init(repository: MangasHomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadMangas() async {
        do {
            self.mangas = try await repository.getMangas()
            state = .loaded
        } catch {
            state = .failed(error.localizedDescription)
        }
        /*if mangas.isEmpty {
            state = .empty
        }*/
    }
}
