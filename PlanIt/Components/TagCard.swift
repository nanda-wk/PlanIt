//
//  TagCard.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import SwiftUI

struct TagCard: View {
    var tag: Tag
    var body: some View {
        Text(tag.name)
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(tag.color)
            .padding(.horizontal, 7)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .fill(tag.color.opacity(0.15))
            )
    }
}
