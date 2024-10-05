//
//  AddTaskScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import SwiftUI

struct AddTaskScreen: View {
    @State private var title = "Code review"
    @State private var date = "5 October 2024"
    @State private var description = ""
    @State private var startTime = "08:00 PM"
    @State private var endTime = "11:00 PM"
    @State private var type: TaskType = .personal

    init() {
        let segmentedAppearance = UISegmentedControl.appearance()
        segmentedAppearance.backgroundColor = .royalBlue.withAlphaComponent(0.15)
        segmentedAppearance.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentedAppearance.selectedSegmentTintColor = .royalBlue
        segmentedAppearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }

    var body: some View {
        VStack {
            CustomNavigationBar(title: "Add task")
            ScrollView {
                Spacer()
                    .frame(height: 30)
                VStack(spacing: 26) {
                    TextFieldModify("Title", text: $title)

                    TextFieldModify("Date", text: $date)

                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.robotoM(16))
                            .foregroundStyle(.textSecondary)

                        Spacer()
                            .frame(height: 18)

                        HStack(spacing: 20) {
                            VStack {
                                TextField("", text: $startTime)
                                    .font(.robotoM(18))
                                    .multilineTextAlignment(.center)
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled(true)

                                Divider()
                            }

                            VStack {
                                TextField("", text: $endTime)
                                    .font(.robotoM(18))
                                    .multilineTextAlignment(.center)
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled(true)

                                Divider()
                            }
                        }
                    }

                    TextFieldModify("Description", text: $description)

                    VStack(alignment: .leading) {
                        Text("Type")
                            .font(.robotoM(16))
                            .foregroundStyle(.textSecondary)

                        Spacer()
                            .frame(height: 18)

                        Picker("Type", selection: $type) {
                            ForEach(TaskType.allCases) { type in
                                Text(type.rawValue)
                                    .tag(type)
                            }
                        }
                        .pickerStyle(.segmented)
                    }

                    VStack(alignment: .leading) {
                        Text("Tags")
                            .font(.robotoM(16))
                            .foregroundStyle(.textSecondary)

                        Spacer()
                            .frame(height: 40)

                        LazyVGrid(columns: .init(repeating: .init(.flexible()), count: 4), spacing: 10) {
                            ForEach(Tag.dummyTags()) { tag in
                                CapsuleTag(tag: tag)
                            }

                            Button {} label: {
                                Text("+ Add new tag")
                                    .font(.robotoR(14))
                                    .foregroundStyle(.royalBlue)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(height: 40)
                    }

                    Spacer()

                    Button {

                    } label: {
                        AppButton(title: "Create")
                    }

                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    private func TextFieldModify(_ title: String , text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.robotoM(16))
                .foregroundStyle(.textSecondary)

            Spacer()
                .frame(height: 18)

            TextField("", text: text)
                .font(.robotoM(18))
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)

            Divider()
        }
    }

    private func CapsuleTag(tag: Tag) -> some View {
        ZStack {
            Capsule()
                .fill(tag.color.opacity(0.15))

            Text(tag.name)
                .font(.robotoR(14))
                .foregroundStyle(tag.color)
                .padding(.horizontal)
        }
        .frame(height: 36)
    }
}

#Preview {
    AddTaskScreen()
}
