//
//  Tag.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import Foundation
import SwiftUI

struct Tag: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let color: Color
}

extension Tag {
    static func dummyTags() -> [Tag] {
        [
            .init(name: "Office", color: .lightPurple),
            .init(name: "Home", color: .red),
            .init(name: "Urgent", color: .lightRed),
            .init(name: "Work", color: .lightBlue),
        ]
    }
}
