//
//  DailyTask.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-30.
//

import Foundation

struct DailyTask: Identifiable {
    let id = UUID()
    let date: Date
    let tasks: [TaskInfo]
}

extension DailyTask {
    static func dummyDailyTask() -> DailyTask {
        .init(date: Date(), tasks: TaskInfo.dummyTasks())
    }

    static func dummyWeeklyTasks() -> [DailyTask] {
        var dailyTasks: [DailyTask] = []
        let calendar = Calendar.current
        let today = Date()

        // Loop through 0 to 6 to represent 7 days
        for i in 0 ..< 7 {
            // Get the date for each day by adding i days to today
            if let date = calendar.date(byAdding: .day, value: i, to: today) {
                // Create a DailyTask for that date
                let dailyTask = DailyTask(date: date, tasks: Array(TaskInfo.dummyTasks().prefix(Int.random(in: 1 ... TaskInfo.dummyTasks().count))))
                dailyTasks.append(dailyTask)
            }
        }
        return dailyTasks
    }
}
