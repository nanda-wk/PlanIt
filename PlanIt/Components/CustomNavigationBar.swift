//
//  CustomNavigationBar.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-30.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.dismiss) var dismiss
    var title: String
    var showBackButton = true
    var showMenuButton = false

    var body: some View {
        HStack {
            if showBackButton {
                Button {
                    dismiss()
                } label: {
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

            if showMenuButton {
                Menu {
                    Button("Setting", image: .setting) {}
                        .tint(.textPrimary)

                    Button("Log Out", image: .logout) {}
                        .tint(.textPrimary)
                } label: {
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
