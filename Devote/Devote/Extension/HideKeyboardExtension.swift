//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Jon Olivet on 2/28/25.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
