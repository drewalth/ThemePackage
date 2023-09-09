//
//  ChildView.swift
//  MyApp
//
//  Created by Andrew Althage on 9/8/23.
//

import SwiftUI

struct ChildView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Current colorscheme:  \(colorScheme == .dark ? "dark" : "light")")
                .font(themeProvider.theme.typography.h1)
                .padding(.bottom, 32)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .font(themeProvider.theme.typography.body1)
        }.padding()
            .background(themeProvider.theme.palette.primary)
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
            .environmentObject(ThemeProvider())
    }
}
