//
//  Tag.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Tag: Identifiable, Equatable, Hashable {
    var id: UUID
    @Attribute(.unique) var name: String
    var color: String
    @Relationship(inverse: \TaskInfo.tags) var task: [TaskInfo]

    init(id: UUID = UUID(), name: String, color: String, task: [TaskInfo] = []) {
        self.id = id
        self.name = name
        self.color = color
        self.task = task
    }
}

//extension Tag {
//    static func dummyTags() -> [Tag] {
//        [
//            .init(id: .init(uuidString: "11231231-2312-1231-2312-123123123123")!, name: "Office", color: .lightPurple),
//            .init(id: .init(uuidString: "21231231-2312-1231-2312-123123123123")!, name: "Home", color: .red),
//            .init(id: .init(uuidString: "31231231-2312-1231-2312-123123123123")!, name: "Urgent", color: .lightRed),
//            .init(id: .init(uuidString: "41231231-2312-1231-2312-123123123123")!, name: "Work", color: .lightBlue),
//        ]
//    }
//}
