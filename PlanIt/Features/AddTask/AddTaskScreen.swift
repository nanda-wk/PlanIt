//
//  AddTaskScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import SwiftUI

struct AddTaskScreen: View {
    @State private var title = "Code review"
    @State private var date = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var description = ""
    @State private var type: TaskType = .personal
    @State private var selectedTags: Set<Tag> = []

    @State private var showDatePicker = false
    @State private var showTimePicker: TimePicker?

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

                    VStack(alignment: .leading) {
                        Text("Date")
                            .font(.robotoM(16))
                            .foregroundStyle(.textSecondary)

                        Spacer()
                            .frame(height: 18)

                        HStack {
                            Text(date.format("d MMMM yyyy"))
                                .font(.robotoM(18))

                            Spacer()

                            Image(.calendar)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .onTapGesture {
                            showDatePicker.toggle()
                        }
                        .sheet(isPresented: $showDatePicker) {
                            CustomDatePicker(currentDate: $date)
                                .presentationDragIndicator(.visible)
                        }

                        Divider()
                    }

                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.robotoM(16))
                            .foregroundStyle(.textSecondary)

                        Spacer()
                            .frame(height: 18)

                        HStack(spacing: 20) {
                            VStack {
                                Text(startTime.format("hh:mm"))
                                    .font(.robotoM(18))

                                Divider()
                            }
                            .onTapGesture {
                                showTimePicker = .start
                            }

                            VStack {
                                Text(endTime.format("hh:mm"))
                                    .font(.robotoM(18))

                                Divider()
                            }
                            .onTapGesture {
                                showTimePicker = .end
                            }
                        }
                        .sheet(item: $showTimePicker) { picker in
                            switch picker {
                            case .start:
                                DatePicker("", selection: $startTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .datePickerStyle(.wheel)
                                    .presentationDetents([.medium])
                                    .presentationDragIndicator(.visible)

                            case .end:
                                DatePicker("", selection: $endTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .datePickerStyle(.wheel)
                                    .presentationDetents([.medium])
                                    .presentationDragIndicator(.visible)
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
                                CapsuleTag(tag: tag, isSelected: selectedTags.contains(tag))
                                    .onTapGesture {
                                        toggleSelection(for: tag)
                                    }
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

                    Button {} label: {
                        AppButton(title: "Create")
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    private func TextFieldModify(_ title: String, text: Binding<String>) -> some View {
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

    private func CapsuleTag(tag: Tag, isSelected: Bool) -> some View {
        ZStack {
            Capsule()
                .fill(tag.color.opacity(isSelected ? 0.5 : 0.15))

            Text(tag.name)
                .font(.robotoR(14))
                .foregroundStyle(tag.color)
                .padding(.horizontal)
        }
        .frame(height: 36)
        .animation(.easeInOut, value: isSelected)
    }

    private enum TimePicker: String, Identifiable {
        var id: String { rawValue }
        case start
        case end
    }

    private func toggleSelection(for tag: Tag) {
        if !selectedTags.insert(tag).inserted {
            selectedTags.remove(tag)
        }
    }
}

#Preview {
    AddTaskScreen()
}
