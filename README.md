# ThemePackage

A proof-of-concept for creating a reusable theme package for SwiftUI apps.

## Use case

Your company/team is building multiple iOS apps that all have to conform to the same branding/style guide and you don't want to define the theme in each project.

## Goals

- [x] Custom Fonts
- [x] Support light + dark modes
- [x] Minimal setup by consuming applications


## Usage

First, setup the theme; register fonts and anything else you may need to do.

```swift
// MyAppApp.swift
import MyCoolTheme
import SwiftUI

@main
struct MyAppApp: App {
    init() {
        MyCoolTheme.setup()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Second, create a theme provider. 

```swift
import Foundation
import MyCoolTheme
import SwiftUI

@MainActor
class ThemeProvider: ObservableObject {
    @Published var theme: MyCoolTheme = .init(for: .light)
}
```

Third, add a few modifiers to support light + dark modes

```swift
// ContentView.swift
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
```

Finally, access the theme in your views

```swift
struct ChildView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Current colorscheme:  \(colorScheme == .dark ? "dark" : "light")")
                .font(themeProvider.theme.typography.h1)
        }.padding()
            .background(themeProvider.theme.palette.primary)
    }
}
```