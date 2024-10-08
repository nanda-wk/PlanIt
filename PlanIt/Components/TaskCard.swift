//
//  TaskCard.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import SwiftUI

struct TaskCard: View {
    var task: TaskInfo

    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 14)
                    .frame(width: 2)
                    .foregroundStyle(Color.foreground(task.status))
                    .padding(.trailing)
                    .padding(.leading, 6)
                    .padding(.vertical, 10)

                VStack(alignment: .leading) {
                    HStack {
                        Text(task.title)
                            .font(.robotoM(18))
                            .foregroundStyle(.textSecondary)

                        Spacer()

                        Menu {
                            if task.status == .onGoing {
                                Button("Disable", image: .closeSquare) {}
                                    .tint(.black)
                            }

                            if task.status == .pending {
                                Button("Enable", image: .tickSquare) {}
                            }

                            if task.status != .completed {
                                Button("Edit", image: .editSquare) {}
                            }

                            if task.status == .completed || task.status == .canceled {
                                Button("Restore", image: .upload) {}
                            }

                            Button("Delete", image: .delete, role: .destructive) {}

                        } label: {
                            Image(systemName: "ellipsis")
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .tint(.black)
                                .rotationEffect(.degrees(90))
                        }
                    }

                    Text(task.timeRange)
                        .font(.robotoR(16))
                        .foregroundStyle(.textSecondary.opacity(0.4))
                }
            }

            HStack {
                ForEach(task.tags) { tag in
                    TagCard(tag: tag)
                }
            }
            .padding(.leading, 32)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.background(task.status))
        )
    }
}
