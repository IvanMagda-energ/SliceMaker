//
//  PhotosPickerViewModel.swift
//  SliceMaker
//
//  Created by Ivan Magda on 16.08.2025.
//

import SwiftUI
import PhotosUI

@Observable
@MainActor
final class PhotosPickerViewModel {
    private(set) var image: PlatformImage?
    
    var error: ViewModelLocalizedError?
    var hasError = false
    
    var isLoading: Bool = false
    
    func loadImage(from item: PhotosPickerItem) async {
        defer {
            isLoading = false
        }
        isLoading = true
        
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else {
                NSLog("Failed to load data from item.")
                throw ViewModelLocalizedError.failedToLoadImage
            }
            
            guard let image = PlatformImage(data: data) else {
                NSLog("Failed to create PlatformImage from data.")
                throw ViewModelLocalizedError.failedToLoadImage
            }
            self.image = image
        } catch let error as ViewModelLocalizedError {
            self.error = error
            self.hasError = true
        } catch {
            NSLog("Unexpected error: \(error)")
            self.error = .failedToLoadImage
            self.hasError = true
        }
    }
}

extension PhotosPickerViewModel {
    enum ViewModelLocalizedError: LocalizedError {
        case failedToLoadImage
        
        var errorDescription: String? {
            switch self {
            case .failedToLoadImage:
                return "Failed to load image."
            }
        }
    }
}
