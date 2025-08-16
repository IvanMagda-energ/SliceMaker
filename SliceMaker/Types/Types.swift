//
//  Types.swift
//  SliceMaker
//
//  Created by Ivan Magda on 11.08.2025.
//

import Foundation
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif


#if os(iOS)
typealias PlatformImage = UIImage
#elseif os(macOS)
typealias PlatformImage = NSImage
#endif
