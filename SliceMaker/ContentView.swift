//
//  ContentView.swift
//  SliceMaker
//
//  Created by Ivan Magda on 04.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(makeAttributed())
            .environment(\.openURL, OpenURLAction(handler: handleURL))
    }
    
    func makeAttributed() -> AttributedString {
        var text = AttributedString("Tap here to learn more.")
        if let range = text.range(of: "here") {
            text[range].link = URL(string: "")
            text[range].foregroundColor = .blue
        }
        return text
    }
    
    func handleURL(_ url: URL) -> OpenURLAction.Result {
        print("Handle \(url) somehow")
        return .handled
    }
}

#Preview {
    ContentView()
}
