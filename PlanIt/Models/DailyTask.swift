//
//  DailyTask.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-30.
//

import Foundation

struct DailyTask: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let taskType: TaskType
    let count: Int
}

extension DailyTask {
    static func dummyWeeklyTasks() -> [DailyTask] {
        var dailyTasks: [DailyTask] = []
        let calendar = Calendar.current
        let today = Date()

        // Loop through 0 to 6 to represent 7 days

        for i in 0 ..< 7 {
            // Get the date for each day by adding i days to today
            if let date = calendar.date(byAdding: .day, value: i, to: today) {
                // Create a DailyTask for that date
                let dailyTask = DailyTask(date: date, taskType: TaskType.allCases.randomElement()!, count: Int.random(in: 1 ... 10))
                dailyTasks.append(dailyTask)
            }
        }

        print(dailyTasks)

        return dailyTasks
    }
}
