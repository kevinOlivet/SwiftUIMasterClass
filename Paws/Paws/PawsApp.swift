//
//  PawsApp.swift
//  Paws
//
//  Created by Jon Olivet on 2/26/25.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
