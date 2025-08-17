//
//  CapsuleButtonStyle.swift
//  SliceMaker
//
//  Created by Ivan Magda on 17.08.2025.
//

import SwiftUI

struct CapsuleButtonStyle: MenuStyle {
    private let padding: CGFloat = 8
    
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .padding(.horizontal)
            .padding(.vertical, padding)
            .background {
                Capsule()
                    .foregroundStyle(Color.accentColor)
            }
            .buttonStyle(.plain)
            .menuIndicator(.hidden)
            .contentShape(Capsule())
    }
}

extension MenuStyle where Self == CapsuleButtonStyle {
    static var capsuleButtonStyle: CapsuleButtonStyle {
        .init()
    }
}
