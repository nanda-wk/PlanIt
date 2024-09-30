//
//  TaskInfo.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import Foundation
import SwiftUI

struct TaskInfo: Identifiable {
    let id = UUID()
    let name: String
    let timeRange: String
    let status: Status
    let type: TaskType
    let tags: [Tag]

    init(name: String, timeRange: String, status: Status = .pending, type: TaskType = .personal, tags: [Tag]) {
        self.name = name
        self.timeRange = timeRange
        self.status = status
        self.type = type
        self.tags = tags
    }
}

extension TaskInfo {
    static func dummyTask() -> TaskInfo {
        .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .pending, type: .personal, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)])
    }

    static func dummyTasks() -> [TaskInfo] {
        [
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .pending, type: .personal, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)]),
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .completed, type: .secret, tags: [.init(name: "Urgent", color: .lightGreen), .init(name: "Home", color: .lightPurple)]),
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .canceled, type: .personal, tags: [.init(name: "Urgent", color: .lightBlue), .init(name: "Home", color: .lightPurple)]),
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .onGoing, type: .confidential, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightRed)]),
        ]
    }
}

struct Tag: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

enum Status: String, CaseIterable {
    case completed = "Completed"
    case pending = "Pending"
    case canceled = "Canceled"
    case onGoing = "On Going"
}

enum TaskType: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case personal = "Personal"
    case confidential = "Private"
    case secret = "Secret"
}
