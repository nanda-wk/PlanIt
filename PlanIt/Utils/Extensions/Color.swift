//
//  Color.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-30.
//

import SwiftUI

extension Color {
    static func foreground(_ status: Status) -> Color {
        switch status {
        case .completed: .lightBlue
        case .pending: .lightPurple
        case .canceled: .lightRed
        case .onGoing: .lightGreen
        }
    }

    static func foreground(_ type: TaskType) -> Color {
        switch type {
        case .personal: .lightRed
        case .confidential: .lightPurple
        case .secret: .lightBlue
        }
    }

    static func background(_ status: Status) -> Color {
        switch status {
        case .completed: .taskCompletedBG
        case .pending: .taskPendingBG
        case .canceled: .taskCanceledBG
        case .onGoing: .taskOngoingBG
        }
    }
}
