//
//  ActivityScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-30.
//

import Charts
import SwiftUI

struct ActivityScreen: View {
    var body: some View {
        VStack {
            CustomNavigationBar(title: "Activity")
            ScrollView {
                VStack {
                    VStack {
                        HStack(spacing: 10) {
                            Text("Priority")
                                .font(.robotoB(22))

                            Spacer()

                            ForEach(TaskType.allCases) { type in
                                HStack {
                                    Circle()
                                        .fill(Color.foreground(type))
                                        .frame(width: 10, height: 10)

                                    Text(type.rawValue)
                                        .font(.robotoR(14))
                                        .foregroundStyle(.textPrimary)
                                }
                            }
                        }
                        .padding(.bottom, 10)

                        Text("Task Perday")
                            .font(.robotoR(16))
                            .foregroundStyle(.textSecondary.opacity(0.4))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Chart {
                            ForEach(DailyTask.dummyWeeklyTasks()) { data in
                                PointMark(
                                    x: .value("Day", data.date),
                                    y: .value("Tasks", data.tasks.count)
                                )
                                .foregroundStyle(.lightRed)
                                .symbolSize(50)
                            }
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    NavigationStack {
        ActivityScreen()
    }
}
