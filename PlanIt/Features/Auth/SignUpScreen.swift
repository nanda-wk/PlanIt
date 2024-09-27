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
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.royalBlue)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 20)

            VStack(spacing: 20) {
                CustomTextField(icon: "person", title: "Username", text: $username)

                CustomTextField(icon: "envelope", title: "Email", text: $email)

                CustomTextField(icon: "lock", title: "Password", text: $password, isSecure: true)

                CustomTextField(icon: "lock", title: "Confirm Password", text: $confirmPassword, isSecure: true)
            }

            Spacer(minLength: 20)

            NavigationLink {
                TabScreen()
            } label: {
                AppButton(title: "Create Account")
            }

            Spacer()

//            Text("or with")
//                .font(.subheadline)
//                .foregroundStyle(.gray)
//
//            SignInWithAppleButton(.signUp) { appleIDRequest in
//
//            } onCompletion: { result in
//
//            }
//            .frame(height: 60)

            NavigationLink {
                SignInScreen()
            } label: {
                Text("Have an account? **Sign In**")
                    .font(.body)
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpScreen()
}
