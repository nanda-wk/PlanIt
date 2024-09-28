//
//  HomeScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import SwiftUI

struct HomeScreen: View {
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hi, Nanda")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.textPrimary)

                        Text("Let's make this day productive")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }

                    Spacer()

                    Image(.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }

                myTask

                VStack {
                    HStack {
                        Text("Today Task")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.textPrimary)

                        Spacer()

                        Button {} label: {
                            Text("View all")
                                .font(.callout)
                                .foregroundStyle(.textPrimary)
                        }
                    }
                    .frame(maxWidth: .infinity)

                    LazyVStack(spacing: 20) {
                        ForEach(TDTask.dummyTasks()) { task in
                            TaskCard(task: task)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .scrollIndicators(.hidden)
        .padding(.top, 1)
    }

    var myTask: some View {
        VStack {
            Text("My Task")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 20) {
                VStack(spacing: 20) {
                    ProgressCardView(image: .imac, title: "Completed", count: 86)

                    ProgressCardView(image: .cancelSquare, isSmallImage: true, title: "Canceled", count: 15, background: .lightRed, foreground: .white, height: 160)
                }

                VStack(spacing: 20) {
                    ProgressCardView(image: .timeSquare, isSmallImage: true, title: "Pending", count: 15, background: .lightPurple, foreground: .white, height: 160)

                    ProgressCardView(image: .tasks, title: "On Going", count: 67, background: .lightGreen)
                }
            }
        }
        .padding(.vertical)
    }

    private func ProgressCardView(image: ImageResource, isSmallImage: Bool = false, title: String, count: Int, background: Color = .lightBlue, foreground: Color = .textPrimary, height: CGFloat = 200) -> some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                Image(image)
                    .resizable()
                    .isSmall(isSmallImage) { view in
                        view.frame(width: 30, height: 30)
                    }
                    .scaledToFit()

                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)

                Text("^[\(count) Task](inflect: true)")
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            Image(systemName: "arrow.forward")
                .scaledToFit()
                .padding()
        }
        .foregroundStyle(foreground)
        .frame(height: height)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(
                    LinearGradient(colors: [background], startPoint: .bottomLeading, endPoint: .topTrailing)
                )
                .shadow(color: background.opacity(0.4), radius: 10, x: 0, y: 5)
        )
    }
}

#Preview {
    HomeScreen()
}
