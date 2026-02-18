//
//  Manga+Mapping.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 18/02/26.
//

import Foundation

extension MangaDTO {

    var toManga: Manga {
        .init(
            id: id,
            mainPicture: mainPicture,
            title: title
        )
    }
}
