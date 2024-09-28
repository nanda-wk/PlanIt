//
//  SignUpScreen.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-27.
//

import AuthenticationServices
import SwiftUI

struct SignUpScreen: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack {
            Spacer()
            Text("Sign Up")
                .font(.robotoB(38))
                .foregroundStyle(.royalBlue)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            VStack {
                CustomTextField(icon: "person", title: "Username", text: $username)

                CustomTextField(icon: "envelope", title: "Email", text: $email)

                CustomTextField(icon: "lock", title: "Password", text: $password, isSecure: true)

                CustomTextField(icon: "lock", title: "Confirm Password", text: $confirmPassword, isSecure: true)
            }

            Spacer()

            NavigationLink {
                TabScreen()
            } label: {
                AppButton(title: "Create Account")
            }

            Spacer()

            CustomDivider()

            SocialButton {} googleAuthAction: {}

            Spacer()

            NavigationLink {
                SignInScreen()
            } label: {
                Text("Have an account? **Sign In**")
                    .font(.robotoR(16))
                    .foregroundStyle(.textSecondary)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpScreen()
}
