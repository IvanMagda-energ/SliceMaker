//
//  NoContentView.swift
//  SliceMaker
//
//  Created by Ivan Magda on 16.08.2025.
//


import SwiftUI

struct NoContentView<T: View>: View {
    let button: () -> T
    
    init(@ViewBuilder button: @escaping () -> T) {
        self.button = button
    }
    
    var body: some View {
        VStack {
            ContentUnavailableView(
                "No Image Selected",
                systemImage: "photo.on.rectangle.angled",
                description: Text("Pick an image to start slicing.")
            )
            button()
        }
        .padding()
    }
}

#Preview {
    NoContentView {
        Button("Pick Image") {}
            .buttonStyle(.borderedProminent)
    }
}
