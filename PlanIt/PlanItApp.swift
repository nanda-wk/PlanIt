//
//  PlanItApp.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import SwiftData
import SwiftUI

@main
struct PlanItApp: App {

    var container: ModelContainer

    @State private var tagRepository: TagRepository

    init() {
        container = SwiftDataManager.shared.container
        tagRepository = TagRepository(modelContext: container.mainContext)
    }

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(container)
                .environment(tagRepository)
        }
    }
}
