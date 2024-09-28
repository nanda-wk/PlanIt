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
        let startDate = calendar.startOfDay(for: date)

        var week: [Weekday] = []
        let weekDate = calendar.dateInterval(of: .weekOfMonth, for: startDate)
        guard (weekDate?.start) != nil else { return [] }

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

        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startDate) else { return [] }

        return fetchWeekday(nextDate)
    }

    func createPreviousWeek() -> [Weekday] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: self)

        guard let nextDate = calendar.date(byAdding: .day, value: -1, to: startDate) else { return [] }

        return fetchWeekday(nextDate)
    }

    var isToaday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
