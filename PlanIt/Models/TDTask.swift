//
//  TDTask.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import Foundation
import SwiftUI

struct TDTask: Identifiable {
    let id = UUID()
    let name: String
    let timeRange: String
    let status: Status

    var foregroundColor: Color {
        status.color
    }

    var backgroundColor: Color {
        switch status {
        case .completed:
            .taskCompletedBG
        case .pending:
            .taskPendingBG
        case .canceled:
            .taskCanceledBG
        case .onGoing:
            .taskOngoingBG
        }
    }

    let tags: [Tag]

    static func dummyTask() -> TDTask {
        .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .pending, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)])
    }

    static func dummyTasks() -> [TDTask] {
        [
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .pending, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightPurple)]),
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .completed, tags: [.init(name: "Urgent", color: .lightGreen), .init(name: "Home", color: .lightPurple)]),
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .canceled, tags: [.init(name: "Urgent", color: .lightBlue), .init(name: "Home", color: .lightPurple)]),
            .init(name: "Cleaning Clothes", timeRange: "07:00 - 07:15", status: .onGoing, tags: [.init(name: "Urgent", color: .lightPurple), .init(name: "Home", color: .lightRed)]),
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

    var color: Color {
        switch self {
        case .completed: .lightGreen
        case .pending: .lightPurple
        case .canceled: .lightRed
        case .onGoing: .lightGreen
        }
    }
}
