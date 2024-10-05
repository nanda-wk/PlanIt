//
//  Date.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import Foundation

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    struct Weekday: Identifiable {
        var id = UUID()
        var date: Date
    }

    func fetchWeekday(_ date: Date = .init()) -> [Weekday] {
        let calendar = Calendar.current
        // Adjust the start date to the previous Saturday if today is not Saturday
        let today = calendar.startOfDay(for: self)
        var startDate = today

        // Find the last Monday
        if let lastMonday = calendar.date(byAdding: .day, value: -((calendar.component(.weekday, from: today) + 5) % 7), to: today) {
            startDate = lastMonday
        }

        var week: [Weekday] = []

        for index in 0 ..< 7 {
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startDate) {
                week.append(.init(date: weekDay))
            }
        }

        return week
    }

    func createNextWeek() -> [Weekday] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: self)

        guard let nextDate = calendar.date(byAdding: .day, value: 7, to: startDate) else { return [] }

        return fetchWeekday(nextDate)
    }

    func createPreviousWeek() -> [Weekday] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: self)

        guard let nextDate = calendar.date(byAdding: .day, value: -7, to: startDate) else { return [] }

        return fetchWeekday(nextDate)
    }

    var isToaday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
