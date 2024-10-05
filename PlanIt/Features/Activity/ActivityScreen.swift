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
            CustomNavigationBar(title: "Activity", showBackButton: false)
            ScrollView {
                VStack {
                    VStack {
                        ChartHeaderSection()

//                        Chart {
//                            ForEach(DailyTask.dummyWeeklyTasks()) { data in
//                                PointMark(
//                                    x: .value("Day", data.date),
//                                    y: .value("Tasks", data.count)
//                                )
//                                .foregroundStyle(by: .value("Type", data.taskType.rawValue))
//                                .symbolSize(data.count * 0.5)
//                                //                                .symbol(by: .value("Pet type", dataSeries.type))
//                            }
//                        }
//                        .chartLegend(.hidden)
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }

    @ViewBuilder
    private func ChartHeaderSection() -> some View {
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
    }
}

#Preview {
    NavigationStack {
        ActivityScreen()
    }
}
