//
//  ProfileScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-01.
//

import SwiftUI

struct ProfileScreen: View {
    private let columns = Array(repeating: GridItem(.fixed(150), spacing: 10), count: 2)
    var body: some View {
        VStack {
            CustomNavigationBar(title: "", showBackButton: false, showMenuButton: true)
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
                        ForEach(Board.dummyBoards()) { board in
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.foreground(board.type).opacity(0.25))

                                VStack(spacing: 10) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 14)
                                            .fill(Color.foreground(board.type))
                                            .frame(width: 50, height: 50)

                                        Image(systemName: "person")
                                            .foregroundStyle(.white)
                                    }

                                    Text(board.name)
                                        .font(.robotoM(16))

                                    Text("^[\(board.tasks.count) Task](inflect: true)")
                                        .font(.robotoM(14))
                                }
                                .padding()
                            }
                        }

                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.lightRed.opacity(0.25))

                            VStack(spacing: 10) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(.lightRed)
                                        .frame(width: 50, height: 50)

                                    Image(systemName: "plus.square")
                                        .foregroundStyle(.white)
                                }

                                Text("Create Board")
                                    .font(.robotoM(16))
                            }
                            .padding()
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
