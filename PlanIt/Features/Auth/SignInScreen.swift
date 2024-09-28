//
//  SignInScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import SwiftUI

struct SignInScreen: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Spacer()

            Text("Login")
                .font(.robotoB(38))
                .foregroundStyle(.royalBlue)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            VStack {
                CustomTextField(icon: "envelope", title: "Email or Username", text: $email)

                CustomTextField(icon: "lock", title: "Password", text: $password, isSecure: true)

                Button {} label: {
                    Text("Forgot Password?")
                        .font(.robotoR(14))
                        .foregroundStyle(.royalBlue)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                }
            }

            Spacer()

            NavigationLink {
                TabScreen()
            } label: {
                AppButton(title: "Login")
            }

            Spacer()

            CustomDivider()

            SocialButton {} googleAuthAction: {}

            Spacer()

            NavigationLink {
                SignUpScreen()
            } label: {
                Text("Don't have an account? **Sign Up**")
                    .font(.robotoR(16))
                    .foregroundStyle(.textSecondary)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 30)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignInScreen()
}
