//
//  ContentView.swift
//  SliceMaker
//
//  Created by Ivan Magda on 04.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var imageData: Data?
    
    var body: some View {
        NavigationStack {
            ZStack {
                if let imageData, let image = Image(data: imageData) {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    NoContentView {
                        ImageSourceMenuView(imageData: $imageData) {
                            Label("Select Image", systemImage: "plus")
                                .foregroundStyle(Color.white)
                        }
                        .menuStyle(.capsuleButtonStyle)
                    }
                }
            }
            .navigationTitle("SliceMaker")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    ImageSourceMenuView(imageData: $imageData) {
                        Image(systemName: "plus")
                    }
                    .menuStyle(.button)
                    .buttonStyle(.plain)
                }
            }
            .animation(.easeInOut, value: imageData)
        }
    }
}

#Preview {
    ContentView()
}
