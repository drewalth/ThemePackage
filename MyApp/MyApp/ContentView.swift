//
//  ContentView.swift
//  MyApp
//
//  Created by Andrew Althage on 9/8/23.
//

import MyCoolTheme
import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var themeProvider = ThemeProvider()

    var body: some View {
        ChildView()
            .environmentObject(themeProvider)
            .onAppear {
                themeProvider.theme = MyCoolTheme(for: colorScheme)
            }
            .onChange(of: colorScheme) { newValue in
                themeProvider.theme = MyCoolTheme(for: newValue)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ThemeProvider())
    }
}
