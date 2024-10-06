//
//  Tag.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import Foundation
import SwiftUI

struct Tag: Identifiable, Equatable, Hashable {
    var id = UUID()
    let name: String
    let color: Color
}

extension Tag {
    static func dummyTags() -> [Tag] {
        [
            .init(id: .init(uuidString: "11231231-2312-1231-2312-123123123123")!, name: "Office", color: .lightPurple),
            .init(id: .init(uuidString: "21231231-2312-1231-2312-123123123123")!, name: "Home", color: .red),
            .init(id: .init(uuidString: "31231231-2312-1231-2312-123123123123")!, name: "Urgent", color: .lightRed),
            .init(id: .init(uuidString: "41231231-2312-1231-2312-123123123123")!, name: "Work", color: .lightBlue),
        ]
    }
}
