//
//  View+Modifier.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import SwiftUI
import SwiftData

extension View {
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }

    @ViewBuilder
    func isSmall(_ condition: Bool, content: (Self) -> some View) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
}


@MainActor extension View {
    func previewEnvironment() -> some View {
        self
            .modelContainer(SwiftDataManager.shared.container)
            .environment(TagRepository(modelContext: SwiftDataManager.shared.container.mainContext))
    }
}
