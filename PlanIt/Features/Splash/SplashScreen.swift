//
//  SplashScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image(.splash)
                .resizable()
                .scaledToFit()

            VStack(spacing: 20) {
                Text("PlantIt")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.royalBlue)

                Text("Plan what you will do to be more organized for\n today, tomorrow and beyond")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            VStack {
                Button {

                } label: {
                    AppButton(title: "Login")

                }

                Button {

                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundStyle(.royalBlue)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                }


            }
            .padding()
        }
    }
}

#Preview {
    SplashScreen()
}
