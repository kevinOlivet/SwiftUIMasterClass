//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy 
//

import SwiftUI
import SwiftData

@main
struct Grocery_ListApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: Item.self)
    }
  }
}
