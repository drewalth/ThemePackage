//
//  ThemeProvider.swift
//  MyApp
//
//  Created by Andrew Althage on 9/8/23.
//

import Foundation
import MyCoolTheme
import SwiftUI

@MainActor
class ThemeProvider: ObservableObject {
    @Published var theme: MyCoolTheme = .init(for: .light)
}
