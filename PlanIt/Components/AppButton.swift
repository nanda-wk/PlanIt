//
//  AppButton.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import SwiftUI

struct AppButton: View {
    var title: String
    var height: CGFloat = 60
    var cornerRadius: CGFloat = 14

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.royalBlue)
                .frame(height: height)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.royalBlue)
                        .shadow(color: .royalBlue.opacity(0.4), radius: 10, x: 0, y: 5)
                )

            Text(title)
                .font(.robotoB(18))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    AppButton(title: "Title")
}
