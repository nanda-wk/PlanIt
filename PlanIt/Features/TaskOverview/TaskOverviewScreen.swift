//
//  TaskOverviewScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-03.
//

import HorizonCalendar
import SwiftUI

struct TaskOverviewScreen: View {
    @State private var searchText = ""
    @State private var showingCalendar = false

    let title: String

    var body: some View {
        VStack {
            CustomNavigationBar(title: "Completed Tasks")
            ScrollView {
                LazyVStack {
                    CustomSearchField(searchText: $searchText, filterButtonAction: {})
                        .padding()

                    Button {
                        showingCalendar.toggle()
                    } label: {
                        HStack {
                            Image(.calendar)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)

                            Text("October 2024")
                                .font(.robotoM(22))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    .buttonStyle(.plain)

                    ForEach(0 ..< 3) { i in
                        Section {
                            ScrollView(.horizontal) {
                                LazyHStack(spacing: 10) {
                                    ForEach(TaskInfo.dummyTaskOverview()) { task in
                                        TaskCard(task: task)
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .scrollIndicators(.hidden)
                            .scrollTargetBehavior(.viewAligned)
                            .contentMargins(.horizontal, 20, for: .scrollContent)
                        } header: {
                            Text("\(Calendar.current.date(byAdding: .day, value: i, to: .init())!.format("d MMMM yyyy"))")
                                .font(.robotoR(16))
                                .foregroundStyle(.textSecondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TaskOverviewScreen(title: "Task Overview")
}
