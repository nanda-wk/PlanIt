//
//  FilterSheet.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import SwiftUI

struct FilterSheet: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sort by tag")
                    .font(.robotoM(16))

                LazyHStack {
                    ForEach(Tag.dummyTags()) { tag in
                        SortCapsule(tag.name, color: tag.color.opacity(0.15), foreground: tag.color)
                    }
                }
                .frame(height: 40)
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("Sort by type")
                    .font(.robotoM(16))

                LazyHStack {
                    ForEach(TaskType.allCases) { type in
                        SortCapsule(type.rawValue, color: .foreground(type), foreground: .white)
                    }
                }
                .frame(height: 40)
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("Sort by")
                    .font(.robotoM(16))

                HStack {
                    SortCapsule("Newest", color: .gray.opacity(0.1), foreground: .black)
                    SortCapsule("Oldest", color: .gray.opacity(0.1), foreground: .black)
                    Spacer()
                }
                .frame(height: 40)
            }
        }
        .padding()
    }

    private func SortCapsule(_ value: String, color: Color, foreground: Color) -> some View {
        ZStack {
            Capsule()
                .fill(color)

            Text(value)
                .font(.robotoR(14))
                .foregroundStyle(foreground)
                .padding(.horizontal)
        }
    }
}

#Preview {
    FilterSheet()
}
