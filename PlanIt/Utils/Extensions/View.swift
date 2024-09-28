//
//  View.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import Foundation
import SwiftUI

extension View {
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
