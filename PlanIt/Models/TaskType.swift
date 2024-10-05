//
//  TaskType.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-03.
//

import Charts
import Foundation

enum TaskType: String, CaseIterable, Identifiable, Plottable {
    var id: String { rawValue }
    case personal = "Personal"
    case confidential = "Private"
    case secret = "Secret"
}
