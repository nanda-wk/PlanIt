//
//  TaskInfo.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import Collections
import Foundation
import SwiftData
import SwiftUI

typealias TasksOverviewGroup = OrderedDictionary<String, [TaskInfo]>

@Model
class TaskInfo: Identifiable, Hashable {
    static func == (lhs: TaskInfo, rhs: TaskInfo) -> Bool {
        lhs.id == rhs.id
    }

    @Attribute(.unique) var id: UUID
    var title: String
    var date: Date
    var timeRange: String
    var tags: [Tag]

    private var statusRaw: String
    private var taskTypeRaw: String

    var type: TaskType {
        get {
            TaskType(rawValue: taskTypeRaw) ?? .personal
        }
        set {
            taskTypeRaw = newValue.rawValue
        }
    }

    var status: Status {
        get {
            Status(rawValue: statusRaw) ?? .onGoing
        }
        set {
            statusRaw = newValue.rawValue
        }
    }

    init(id: UUID = UUID(), title: String, date: Date = .init(), timeRange: String, status: Status = .pending, type: TaskType = .personal, tags: [Tag]) {
        self.id = id
        self.title = title
        self.date = date
        self.timeRange = timeRange
        self.statusRaw = status.rawValue
        self.taskTypeRaw = type.rawValue
        self.tags = tags
    }
}

//extension TaskInfo {
//    var month: String {
//        date.format("dd MMMM yyyy")
//    }
//
//    static func dummyTask() -> TaskInfo {
//        .init(title: "Cleaning Clothes", date: .init(), timeRange: "07:00 - 07:15", status: .pending, type: .personal, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)])
//    }
//
//    static func dummyTasks() -> [TaskInfo] {
//        [
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 1, to: .init())!, timeRange: "07:00 - 07:15", status: .pending, type: .personal, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 1, to: .init())!, timeRange: "07:00 - 07:15", status: .completed, type: .secret, tags: [.init(name: "Urgent", color: .lightGreen), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 1, to: .init())!, timeRange: "07:00 - 07:15", status: .canceled, type: .personal, tags: [.init(name: "Urgent", color: .lightBlue), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 1, to: .init())!, timeRange: "07:00 - 07:15", status: .onGoing, type: .confidential, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightRed)]),
//        ]
//    }
//
//    static func dummyTaskOverview() -> [TaskInfo] {
//        [
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 1, to: .init())!, timeRange: "07:00 - 07:15", status: .pending, type: .personal, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 2, to: .init())!, timeRange: "07:00 - 07:15", status: .completed, type: .secret, tags: [.init(name: "Urgent", color: .lightGreen), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 3, to: .init())!, timeRange: "07:00 - 07:15", status: .canceled, type: .personal, tags: [.init(name: "Urgent", color: .lightBlue), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 4, to: .init())!, timeRange: "07:00 - 07:15", status: .onGoing, type: .confidential, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightRed)]),
//
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 31, to: .init())!, timeRange: "07:00 - 07:15", status: .pending, type: .personal, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 32, to: .init())!, timeRange: "07:00 - 07:15", status: .completed, type: .secret, tags: [.init(name: "Urgent", color: .lightGreen), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 33, to: .init())!, timeRange: "07:00 - 07:15", status: .canceled, type: .personal, tags: [.init(name: "Urgent", color: .lightBlue), .init(name: "Home", color: .lightPurple)]),
//            .init(title: "Cleaning Clothes", date: Calendar.current.date(byAdding: .day, value: 34, to: .init())!, timeRange: "07:00 - 07:15", status: .onGoing, type: .confidential, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightRed)]),
//        ]
//    }
//
//    static var dummyGroupTasks: TasksOverviewGroup {
//        TasksOverviewGroup(grouping: TaskInfo.dummyTaskOverview()) { $0.month }
//    }
//}

enum Status: String, CaseIterable {
    case completed = "Completed"
    case pending = "Pending"
    case canceled = "Canceled"
    case onGoing = "On Going"
}
