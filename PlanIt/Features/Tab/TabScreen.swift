//
//  TabScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import SwiftUI

struct TabScreen: View {
    @State private var selected: TabItem = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                NavigationStack {
                    Text(selected.rawValue.capitalized)
                }
            }
            CustomTabBar()
        }
        .navigationBarBackButtonHidden(true)
    }

    @ViewBuilder
    private func CustomTabBar() -> some View {
        HStack(spacing: 10) {
            VStack(spacing: 4) {
                Image(selected == .home ? .homeFill : .home)
                    .resizable()
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(selected == .home ? .royalBlue : .white)
                    .frame(width: 6)
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                selected = .home
            }

            VStack(spacing: 4) {
                Image(selected == .task ? .taskFill : .task)
                    .resizable()
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(selected == .task ? .royalBlue : .white)
                    .frame(width: 6)
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                selected = .task
            }

            NavigationLink {} label: {
                Image(systemName: "plus")
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        Circle().fill(.royalBlue)
                    )
            }

            VStack(spacing: 4) {
                Image(selected == .activity ? .activityFill : .activity)
                    .resizable()
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(selected == .activity ? .royalBlue : .white)
                    .frame(width: 6)
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                selected = .activity
            }

            VStack(spacing: 4) {
                Image(selected == .folder ? .folderFill : .folder)
                    .resizable()
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(selected == .folder ? .royalBlue : .white)
                    .frame(width: 6)
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                selected = .folder
            }
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
        )
        .padding()
    }
}

enum TabItem: String, Identifiable {
    case home, task, activity, folder

    var id: String {
        rawValue
    }

    var icon: ImageResource {
        switch self {
        case .home:
            .home
        case .task:
            .task
        case .activity:
            .activity
        case .folder:
            .folder
        }
    }

    var selectedIcon: ImageResource {
        switch self {
        case .home:
            .homeFill
        case .task:
            .taskFill
        case .activity:
            .activityFill
        case .folder:
            .folderFill
        }
    }
}

#Preview {
    TabScreen()
}
