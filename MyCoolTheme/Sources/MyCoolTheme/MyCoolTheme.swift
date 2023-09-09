import CoreText
import class Foundation.Bundle
import SwiftUI

public struct MyCoolTheme {
    public var palette: MyColors
    public var typography: MyTypography
    public static func setup() {
        do {
            try registerFont(named: "IBMPlexMono-Light")
            try registerFont(named: "IBMPlexMono-Regular")
            try registerFont(named: "IBMPlexMono-Bold")
        } catch {
            print("Error registering fonts: \(error)")
        }
    }
}

public struct MyColors {
    private var colorScheme: ColorScheme

    public init(_ colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
    }

    public var primary: Color {
        colorScheme == .dark ? .gray : .blue
    }

    public var secondary: Color {
        colorScheme == .dark ? .yellow : .green
    }
}

public struct MyTypography {
    public var h1: Font
    public var h2: Font
    public var body1: Font

    public init() {
        h1 = Font.custom("IBMPlexMono-Light", size: 34)
        h2 = Font.custom("IBMPlexMono-Bold", size: 24)
        body1 = Font.custom("IBMPlexMono-Regular", size: 16)
    }
}

public extension MyCoolTheme {
    init(for colorScheme: ColorScheme) {
        self.palette = MyColors(colorScheme)
        self.typography = .init()
    }
}
