//
//  TagCard.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import SwiftUI

struct TagCard: View {
    let tag: Tag
    var body: some View {
        Text(tag.name)
            .font(.robotoM(12))
            .foregroundStyle(Color(hex: tag.color))
            .padding(.horizontal, 7)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(hex: tag.color).opacity(0.15))
            )
    }
}
