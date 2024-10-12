//
//  FilterSheet.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import SwiftData
import SwiftUI

struct FilterSheet: View {
    @Binding var filter: Filter
    @Query private var tags: [Tag] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Spacer()
                .frame(height: 1)
                .frame(maxWidth: .infinity)

            VStack(alignment: .leading, spacing: 20) {
                Text("Sort by tag")
                    .font(.robotoM(16))

                LazyHStack {
                    ForEach(tags) { tag in
                        SortCapsule(tag.name, color: Color(hex: tag.color).opacity(0.15), foreground: Color(hex: tag.color), isSelected: filter.sortByTags.contains(tag))
                            .onTapGesture {
                                toggleSelection(forTag: tag)
                            }
                    }
                }
                .frame(height: 40)
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("Sort by type")
                    .font(.robotoM(16))

                LazyHStack {
                    ForEach(TaskType.allCases) { type in
                        SortCapsule(type.rawValue, color: .foreground(type), foreground: .white, isSelected: filter.sortByType.contains(type))
                            .onTapGesture {
                                toggleSelection(forType: type)
                            }
                    }
                }
                .frame(height: 40)
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("Sort by")
                    .font(.robotoM(16))

                LazyHStack {
                    SortCapsule("Newest", color: .royalBlue, foreground: .white, isSelected: filter.sortByDate.contains(.newest))
                        .onTapGesture {
                            toggleSelection(forDate: .newest)
                        }
                    SortCapsule("Oldest", color: .royalBlue, foreground: .white, isSelected: filter.sortByDate.contains(.oldest))
                        .onTapGesture {
                            toggleSelection(forDate: .oldest)
                        }

                    Spacer()
                }
                .frame(height: 40)
            }
        }
        .padding()
    }

    private func SortCapsule(_ value: String, color: Color, foreground: Color, isSelected: Bool) -> some View {
        ZStack {
            Capsule()
                .fill(isSelected ? color : .gray.opacity(0.14))

            Text(value)
                .font(.robotoR(14))
                .foregroundStyle(isSelected ? foreground : .black)
                .padding(.horizontal)
        }
        .animation(.easeInOut, value: isSelected)
    }

    private func toggleSelection(forTag tag: Tag? = nil, forType type: TaskType? = nil, forDate dateRange: Filter.SortByDate? = nil) {
        if let tag {
            if !filter.sortByTags.insert(tag).inserted {
                filter.sortByTags.remove(tag)
            }
        }

        if let type {
            if !filter.sortByType.insert(type).inserted {
                filter.sortByType.remove(type)
            }
        }

        if let dateRange {
            if !filter.sortByDate.insert(dateRange).inserted {
                filter.sortByDate.remove(dateRange)
            }
        }
    }
}

#Preview {
    FilterSheet(filter: .constant(Filter()))
}
