//
//  CustomSearchField.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-03.
//

import SwiftUI

struct CustomSearchField: View {
    @Binding var filter: Filter
    @State private var isPresented = false
    var showFilter = false

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.1))

                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)

                    TextField(text: $filter.searchText) {
                        Text("Search for task")
                            .font(.robotoR(16))
                            .foregroundStyle(.gray.opacity(0.5))
                            .padding(.trailing)
                    }
                    .foregroundStyle(.textPrimary)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled(true)
                    .overlay {
                        HStack {
                            Spacer()
                            if !filter.searchText.isEmpty {
                                Button {
                                    filter.searchText = ""
                                } label: {
                                    Image(systemName: "xmark.app.fill")
                                }
                            }
                        }
                    }
                }
                .foregroundStyle(.gray.opacity(0.5))
                .padding()
            }

            if showFilter {
                Button {
                    isPresented.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.gray.opacity(0.1))

                        Image(.filter)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }
                .frame(width: 60)
                .sheet(isPresented: $isPresented) {
                    FilterSheet(filter: $filter)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            }
        }
        .frame(height: 60)
    }
}
