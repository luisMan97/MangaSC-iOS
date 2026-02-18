//
//  URL+Constants.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 18/02/26.
//

import Foundation

private extension URL {
    static let baseURL = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com")!
}

extension URL {
    static let getMangas = baseURL.appending(path: "/list/mangas?page=1&per=50")
}
