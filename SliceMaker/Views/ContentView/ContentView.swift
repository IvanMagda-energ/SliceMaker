//
//  ContentView.swift
//  SliceMaker
//
//  Created by Ivan Magda on 04.08.2025.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var viewModel = PhotosPickerViewModel()
    @State private var isPhotosPickerPresented: Bool = false
    @State private var isCameraPresented: Bool = false
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            ZStack {
                if let image = viewModel.image {
                    imageView(image)
                } else {
                    NoContentView {
                        isPhotosPickerPresented.toggle()
                    }
                }
            }
            .navigationTitle("SliceMaker")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    ImageSourceMenuView(
                        isPhotosPickerPresented: $isPhotosPickerPresented,
                        isCameraPresented: $isCameraPresented
                    )
                }
            }
            .photosPicker(
                isPresented: $isPhotosPickerPresented,
                selection: $selectedItem,
                matching: .images
            )
            .onChange(of: selectedItem) {
                if let selectedItem = selectedItem {
                    Task {
                        await viewModel.loadImage(from: selectedItem)
                    }
                }
            }
            .animation(.easeInOut, value: viewModel.image)
        }
    }
    
    private func imageView(_ image: PlatformImage) -> some View {
#if os(iOS)
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
#elseif os(macOS)
        Image(nsImage: image)
            .resizable()
            .scaledToFit()
#endif
    }
}

#Preview {
    ContentView()
}
