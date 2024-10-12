//
//  TaskScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import SwiftUI

struct TaskScreen: View {
    @State private var filter = Filter()
    @State private var currentDate = Date()
    @State private var currentTime = Date().format("hh:mm")
    @State private var currentWeekIndex: Int = 0

    @GestureState private var dragOffset = CGSize.zero

    var body: some View {
        ScrollView {
            VStack {
                CustomSearchField(filter: $filter)
                    .padding(.horizontal)
                    .padding(.bottom)

                VStack {
                    HStack {
                        Text("Task")
                            .font(.robotoB(26))
                            .foregroundStyle(.textPrimary)

                        Spacer()

                        Button {} label: {
                            Label {
                                Text(currentDate.format("MMMM yyyy"))
                                    .font(.robotoR(14))
                            } icon: {
                                Image(.calendar)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                            }
                            .foregroundStyle(.textSecondary)
                        }
                    }

                    WeekView(currentDate.fetchWeekday())

                    HStack {
                        Text("Today")
                            .font(.robotoM(22))
                            .foregroundStyle(.textPrimary)

                        Spacer()

                        Text(currentTime)
                            .font(.robotoR(16))
                    }
                }
                .padding(.horizontal)

//                TaskEmpty()

                LazyVStack {
//                    HourlyTasks(time: "07:00", tasks: TaskInfo.dummyTasks())
//                    HourlyTasks(time: "08:00", tasks: TaskInfo.dummyTasks().shuffled())
//                    HourlyTasks(time: "09:00", tasks: [])
//                    HourlyTasks(time: "10:00", tasks: TaskInfo.dummyTasks().shuffled())
                }
                .padding(.leading)
            }
            .padding(.bottom)
            .onAppear {
                startClock()
            }
        }
        .scrollIndicators(.hidden)
        .padding(.top, 1)
    }

    // TODO: - Review WeekPicker
    @ViewBuilder
    private func WeekView(_ week: [Date.Weekday]) -> some View {
        HStack(spacing: 10) {
            ForEach(week) { day in
                VStack(spacing: 10) {
                    Text(day.date.format("E").prefix(2).uppercased())
                        .font(.robotoM(18))

                    Text(day.date.format("dd"))
                        .font(.robotoR(16))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .foregroundStyle(isSameDay(currentDate, day.date) ? .white : .textPrimary)
                .background(
                    isSameDay(currentDate, day.date) ? RoundedRectangle(cornerRadius: 12)
                        .fill(.royalBlue) : nil
                )
                .onTapGesture {
                    withAnimation {
                        currentDate = day.date
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }

    private func HourlyTasks(time: String, tasks: [TaskInfo]) -> some View {
        VStack(spacing: 20) {
            Divider()
                .padding(.trailing)

            HStack(alignment: .top, spacing: 20) {
                Text(time)
                    .font(.robotoM(16))
                    .foregroundStyle(.textSecondary)

                if tasks.isEmpty {
                    Button {} label: {
                        Group {
                            Text("You don’t have any schedule")

                            Text("or")
                        }
                        .foregroundStyle(.textSecondary.opacity(0.5))

                        Text("+ Add")
                            .fontWeight(.medium)
                            .foregroundStyle(.textPrimary)
                    }
                    .font(.robotoR(14))
                    .padding(.horizontal)
                } else {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach(tasks) { task in
                                TaskCard(task: task)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(.horizontal, 20, for: .scrollContent)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func TaskEmpty() -> some View {
        VStack(spacing: 30) {
            Spacer()
                .frame(height: 50)

            Image(.unavailable)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Text("You don’t have any schedule today.\nTap the plus button to create new to-do.")
                .font(.robotoM(16))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
        }
    }

    private func startClock() {
        // Update the clock every second
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            updateTime()
        }
    }

    private func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm" // Adjust the format as needed
        currentTime = formatter.string(from: Date())
    }
}

#Preview {
    TaskScreen()
}
