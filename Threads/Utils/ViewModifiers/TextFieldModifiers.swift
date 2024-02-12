//
//  TextFieldModifiers.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct TextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}

