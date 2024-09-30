//
//  CustomNavigationBar.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-30.
//

import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    var backButtonAction: (() -> Void)?
    var menuButtonAction: (() -> Void)?

    var body: some View {
        HStack {
            if let backButtonAction {
                Button(action: backButtonAction) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                            )

                        Image(.arrow)
                            .scaledToFit()
                    }
                }

            } else {
                Spacer()
                    .frame(width: 50, height: 50)
            }

            Spacer()

            Text(title)
                .font(.robotoB(20))
                .foregroundColor(.textPrimary)

            Spacer()

            if let menuButtonAction {
                Button(action: menuButtonAction) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                            )

                        Image(.menu)
                            .scaledToFit()
                    }
                }
            } else {
                Spacer()
                    .frame(width: 50, height: 50)
            }
        }
        .padding(.bottom, 4)
        .padding(.horizontal)
    }
}
