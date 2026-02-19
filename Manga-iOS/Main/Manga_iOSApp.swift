//
//  Manga_iOSApp.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 18/02/26.
//

import SwiftUI
import SwiftData

@main
struct Manga_iOSApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MangasHomeFactory.getMangasHomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
