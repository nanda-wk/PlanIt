//
//  CustomTextField.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import SwiftUI

struct CustomTextField: View {
    var icon: String
    var title: String
    @Binding var text: String
    var isSecure = false

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .foregroundStyle(.gray.opacity(0.5))

            if !isSecure {
                TextField(title, text: $text)
            } else {
                SecureField(title, text: $text)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .stroke(.gray.opacity(0.3), lineWidth: 1)
        )
    }
}
