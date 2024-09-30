//
//  ProfileScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-01.
//

import SwiftUI

struct ProfileScreen: View {
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    var body: some View {
        VStack {
            CustomNavigationBar(title: "", menuButtonAction: {})
            ScrollView {
                VStack(spacing: 30) {
                    VStack(spacing: 20) {
                        Image(.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)

                        Text("Nanda")
                            .font(.robotoB(22))

                        Text("nanda@example.com")
                            .font(.robotoR(16))
                    }
                    .foregroundStyle(.textPrimary)

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0 ..< 6) { _ in
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(.lightPurple.opacity(0.25))
                                    .frame(width: 156, height: 156)

                                VStack(spacing: 10) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 14)
                                            .fill(.lightPurple)
                                            .frame(width: 50, height: 50)

                                        Image(systemName: "person")
                                            .foregroundStyle(.white)
                                    }

                                    Text("Personal")
                                        .font(.robotoM(16))

                                    Text("6 Tasks")
                                        .font(.robotoM(14))
                                }
                                .padding()
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ProfileScreen()
}
