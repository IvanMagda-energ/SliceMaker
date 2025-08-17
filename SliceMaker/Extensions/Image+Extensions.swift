//
//  Image+Extensions.swift
//  SliceMaker
//
//  Created by Ivan Magda on 17.08.2025.
//

import SwiftUI

extension Image {
    /// Initializes an image from the given raw data.
    ///
    /// - Parameter data: The image data used to create a `UIImage` on iOS or an `NSImage` on macOS.
    /// - Returns: An initialized image if the data is valid, otherwise `nil`.
    public init?(data: Data) {
        guard let platformImage = PlatformImage(data: data) else {
            return nil
        }
#if os(iOS)
        self.init(uiImage: platformImage)
#elseif os(macOS)
        self.init(nsImage: platformImage)
#endif
    }
}
