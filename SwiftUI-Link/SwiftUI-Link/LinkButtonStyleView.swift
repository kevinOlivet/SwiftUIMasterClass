//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct LinkButtonStyleView: View {
  var body: some View {
    VStack(spacing: 30) {
      Link("Go to Apple", destination: URL(string: "https://apple.com")!)
        .buttonStyle(.borderless)
      
      Link("Call To Action", destination: URL(string: "tel:1234567890")!)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.regular)
      
      Link("Send an Email", destination: URL(string: "mailto:swiftui@apple.com")!)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .tint(.pink)
      
      Link("Credo Academy", destination: URL(string: "https://credo.academy")!)
        .buttonStyle(.plain)
        .padding()
        .border(.primary, width: 2)
    }
    .font(.largeTitle)
  }
}

struct LinkButtonStyleView_Previews: PreviewProvider {
  static var previews: some View {
    LinkButtonStyleView()
  }
}
