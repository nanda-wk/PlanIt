//
//  TaskCard.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-28.
//

import SwiftUI

struct TaskCard: View {
    var task: TDTask

    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 14)
                    .frame(width: 2)
                    .foregroundStyle(task.foregroundColor)
                    .padding(.trailing)
                    .padding(.leading, 6)

                VStack(alignment: .leading) {
                    HStack {
                        Text(task.name)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundStyle(.textSecondary)

                        Spacer()

                        Image(systemName: "ellipsis")
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .tint(.black)
                            .rotationEffect(.degrees(90))
                    }

                    Text(task.timeRange)
                        .font(.body)
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
                .fill(task.backgroundColor)
        )
    }
}
