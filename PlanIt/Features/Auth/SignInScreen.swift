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
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.royalBlue)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 20)

            VStack(spacing: 20) {
                CustomTextField(icon: "envelope", title: "Email or Username", text: $email)

                CustomTextField(icon: "lock", title: "Password", text: $password, isSecure: true)

                Button {} label: {
                    Text("Forgot Password?")
                        .font(.headline)
                        .foregroundStyle(.royalBlue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }

            Spacer(minLength: 20)

            NavigationLink {
                TabScreen()
            } label: {
                AppButton(title: "Login")
            }

            Spacer()

            NavigationLink {
                SignUpScreen()
            } label: {
                Text("Don't have an account? **Sign Up**")
                    .font(.body)
                    .foregroundStyle(.textSecondary)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignInScreen()
}
