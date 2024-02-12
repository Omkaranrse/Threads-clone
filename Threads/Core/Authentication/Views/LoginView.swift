//
//  LoginView.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Image("threads-logo-transparent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack(spacing: 20){
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .modifier(TextFieldModifiers())
                    
                    SecureField("Enter your paswword", text: $viewModel.password)
                        .modifier(TextFieldModifiers())
                }
                
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button(action: {
                    Task{ try await viewModel.login() }
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding(.horizontal, 25)
                
                Spacer()

                Divider()
                
                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up").fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)

            }
        }
    }
}

#Preview {
    LoginView()
}
