//
//  Board.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-03.
//

import Foundation

struct Board: Identifiable {
    let id = UUID()
    let name: String
    let type: TaskType
    let tasks: [TaskInfo]
}

extension Board {
    static func dummyBoards() -> [Board] {
        [
            .init(name: "Personal", type: .personal, tasks: TaskInfo.dummyTasks()),
            .init(name: "Work", type: .secret, tasks: TaskInfo.dummyTasks()),
            .init(name: "Private", type: .confidential, tasks: TaskInfo.dummyTasks()),
            .init(name: "Meeting", type: .personal, tasks: TaskInfo.dummyTasks()),
            .init(name: "Event", type: .personal, tasks: TaskInfo.dummyTasks()),
        ]
    }
}
