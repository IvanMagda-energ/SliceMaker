//
//  ImageSourceMenuView.swift
//  SliceMaker
//
//  Created by Ivan Magda on 16.08.2025.
//

import SwiftUI
import PhotosUI

struct ImageSourceMenuView<T: View>: View {
    @State private var viewModel = PhotosPickerViewModel()
    @State private var isPhotosPickerPresented: Bool = false
    @State private var isCameraPresented: Bool = false
    @State private var selectedItem: PhotosPickerItem?
    
    @Binding var imageData: Data?
    
    var label: () -> T
    
    var body: some View {
        Menu {
            Button {
                isPhotosPickerPresented.toggle()
            } label: {
                Label("Open Gallery", systemImage: "photo")
                    .labelStyle(.titleAndIcon)
            }
            
            Button {
                isCameraPresented.toggle()
            } label: {
                Label("Open Camera", systemImage: "camera")
                    .labelStyle(.titleAndIcon)
            }
        } label: {
            label()
        }        
        .photosPicker(
            isPresented: $isPhotosPickerPresented,
            selection: $selectedItem,
            matching: .images
        )
        .onChange(of: selectedItem) {
            if let selectedItem = selectedItem {
                Task {
                    imageData = await viewModel.loadImage(from: selectedItem)
                }
            }
        }
    }
}

#Preview {
    ImageSourceMenuView(imageData: .constant(nil)) {
        Label("", systemImage: "plus")
    }
}
