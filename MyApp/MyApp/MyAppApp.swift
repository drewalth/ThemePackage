//
//  MyAppApp.swift
//  MyApp
//
//  Created by Andrew Althage on 9/8/23.
//

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
