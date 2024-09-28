//
//  SocialButton.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-29.
//

import SwiftUI

struct SocialButton: View {
    var appleAuthAction: () -> Void
    var googleAuthAction: () -> Void
    var body: some View {
        HStack(spacing: 20) {
            Button(action: appleAuthAction) {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(14)
                    .background(
                        Circle()
                            .stroke(.gray, lineWidth: 0.8)
                    )
                    .foregroundStyle(.black)
            }

            Button(action: googleAuthAction) {
                Image(.google)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(14)
                    .background(
                        Circle()
                            .stroke(.gray, lineWidth: 0.8)
                    )
            }
        }
        .padding(.vertical)
    }
}
