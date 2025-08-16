//
//  NoContentView.swift
//  SliceMaker
//
//  Created by Ivan Magda on 16.08.2025.
//


import SwiftUI

struct NoContentView: View {
    let action: () -> Void
    
    var body: some View {
        VStack {
            ContentUnavailableView(
                "No Image Selected",
                systemImage: "photo.on.rectangle.angled",
                description: Text("Pick an image to start slicing.")
            )
            Button {
                action()
            } label: {
                Label("Select Image", systemImage: "plus")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}

#Preview {
    NoContentView {}
}
