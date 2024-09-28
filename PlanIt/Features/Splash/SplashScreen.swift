//
//  SplashScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        NavigationStack {
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
                        .foregroundStyle(.textSecondary)
                        .multilineTextAlignment(.center)
                }

                Spacer()

                VStack {
                    NavigationLink {
                        SignInScreen()
                    } label: {
                        AppButton(title: "Login")
                    }

                    NavigationLink {
                        SignUpScreen()
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
}

#Preview {
    SplashScreen()
}
