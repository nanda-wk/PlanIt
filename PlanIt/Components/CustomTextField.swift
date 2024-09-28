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

    @State private var showPassword = true

    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                HStack(spacing: 20) {
                    Image(systemName: icon)
                        .foregroundStyle(.gray.opacity(0.5))

                    Group {
                        if !isSecure || !showPassword {
                            TextField(title, text: $text)

                        } else {
                            SecureField(title, text: $text)
                        }
                    }
                    .font(.robotoR(18))
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled(true)
                }

                if isSecure {
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                            .tint(.gray.opacity(0.5))
                    }
                }
            }

            .padding(.bottom, 5)

            Divider()
        }
        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 18)
//                .stroke(.gray.opacity(0.3), lineWidth: 1)
//        )
    }
}

#Preview {
    CustomTextField(icon: "lock", title: "Password", text: .constant(""), isSecure: true)
}
