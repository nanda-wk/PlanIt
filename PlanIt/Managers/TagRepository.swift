//
//  TagRepository.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-12.
//

import Foundation
import SwiftData

@MainActor
@Observable
final class TagRepository {

    var tags: [Tag] = []
    var error = ""

    private var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchAllTag()
    }

    func fetchAllTag() {

        let fetchDescriptor = FetchDescriptor<Tag>()
        do {
            tags = try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch tasks: \(error.localizedDescription)")
        }
    }

    func saveTag(_ tag: Tag) {

        if tags.count > 5 {
            error = "Maximum of 5 tags is reached"
            return
        }

        modelContext.insert(tag)
        try? modelContext.save()
        fetchAllTag()
        error = ""
    }

    func delete(_ tag: Tag) {
        modelContext.delete(tag)
        try? modelContext.save()
        fetchAllTag()
    }
}
