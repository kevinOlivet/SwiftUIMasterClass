//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Jon Olivet on 2/27/25.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
