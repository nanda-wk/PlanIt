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
                Spacer()

                Image(.splash)
                    .resizable()
                    .scaledToFit()

                Spacer()

                VStack(spacing: 20) {
                    Text("PlantIt")
                        .font(.robotoR(34))
                        .foregroundStyle(.royalBlue)

                    Text("Plan what you will do to be more organized for\n today, tomorrow and beyond")
                        .font(.robotoR(16))
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
                            .font(.robotoB(18))
                            .foregroundStyle(.royalBlue)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    SplashScreen()
}
