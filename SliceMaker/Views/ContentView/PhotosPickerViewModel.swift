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
    var error: ViewModelLocalizedError?
    var hasError = false
    
    var isLoading: Bool = false
    
    func loadImage(from item: PhotosPickerItem) async -> Data? {
        defer {
            isLoading = false
        }
        isLoading = true
        
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else {
                NSLog("Failed to load data from item.")
                throw ViewModelLocalizedError.failedToLoadImage
            }
            return data
        } catch let error as ViewModelLocalizedError {
            self.error = error
            self.hasError = true
            return nil
        } catch {
            NSLog("Unexpected error: \(error)")
            self.error = .failedToLoadImage
            self.hasError = true
            return nil
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
