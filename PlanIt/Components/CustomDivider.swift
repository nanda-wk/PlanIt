//
//  CustomDivider.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-29.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 1)
            Text("or with")
                .font(.robotoR(14))
                .padding(.horizontal)
            Rectangle()
                .frame(height: 1)
        }
        .padding()
        .foregroundStyle(.gray)
    }
}
