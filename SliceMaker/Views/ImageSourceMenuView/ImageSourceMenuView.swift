//
//  ImageSourceMenuView.swift
//  SliceMaker
//
//  Created by Ivan Magda on 16.08.2025.
//

import SwiftUI

struct ImageSourceMenuView: View {
    @Binding var isPhotosPickerPresented: Bool
    @Binding var isCameraPresented: Bool
    
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
            Image(systemName: "plus")
        }
        .menuIndicator(.hidden)
        .menuStyle(.borderlessButton)
    }
}

#Preview {
    ContentView()
}
