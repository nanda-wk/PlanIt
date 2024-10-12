//
//  AddNewTagSheet.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-12.
//

import SwiftUI

struct AddNewTagSheet: View {
    @Environment(TagRepository.self) var tagRepository
    @Environment(\.dismiss) var dismiss

    var tag: Tag? = nil
    @State private var name = ""
    @State private var color = Color.royalBlue

    private var title: String {
        tag == nil ? "New Tag" : "Edit Tag"
    }

    private var buttonTitle: String {
        tag == nil ? "Save" : "Update"
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.robotoM(16))
                    .foregroundStyle(.textSecondary)

                TextField("", text: $name)
                    .font(.custom("Roboto", size: 20))
                    .foregroundColor(.textPrimary)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.5))
                    )


                ColorPicker("Tag Color", selection: $color)

                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.robotoR(18))
                            .foregroundStyle(.royalBlue)
                    }

                }

                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.robotoB(24))
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        save()
                    } label: {
                        Text(buttonTitle)
                            .font(.robotoR(18))
                            .foregroundStyle(.royalBlue)
                    }
                    .disabled(name.isEmpty)
                }
            }
            .onAppear {
                if let tag {
                    name = tag.name
                    color = Color(hex: tag.color)
                }
            }
        }
    }

    private func save() {
        if let tag {
            tag.name = name
            tag.color = color.hexString
        } else {
            let newTag = Tag(name: name, color: color.hexString)
            tagRepository.saveTag(newTag)
        }
        dismiss()
    }
}

#Preview {
    AddNewTagSheet()
        .previewEnvironment()
}
