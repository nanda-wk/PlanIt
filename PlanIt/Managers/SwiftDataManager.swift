//
//  SwiftDataManager.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-12.
//

import Foundation
import SwiftData

final class SwiftDataManager {

    static let shared = SwiftDataManager()

    var container: ModelContainer = {
        let scheme = Schema([
            TaskInfo.self,
            Tag.self
        ])

        let modelConfiguration = ModelConfiguration(schema: scheme,
                                                    isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: scheme, configurations: modelConfiguration)
        } catch {
            fatalError("Could not create model container \(error)")
        }

    }()
}
