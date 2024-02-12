//
//  SignUpView.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()

                Image("threads-logo-transparent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack{
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .modifier(TextFieldModifiers())

                    SecureField("Enter your paswword", text: $viewModel.password)
                        .modifier(TextFieldModifiers())

                    TextField("Enter your full name", text: $viewModel.fullName)
                        .modifier(TextFieldModifiers())

                    TextField("Enter your user name", text: $viewModel.userName)
                        .modifier(TextFieldModifiers())
                        .textInputAutocapitalization(.never)
                }
                            
                Button(action: {
                    Task{ try await viewModel.createUser() }
                }, label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding(.vertical)

                Spacer()

                Divider()
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign In").fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)

            }
        }

    }
    
    func show() -> Alert {
        Alert(
            title: Text("Error occured"),
            primaryButton: .destructive(Text("DELETE"),action: {
                
            }),
            secondaryButton: .cancel(Text("CANCEL"), action: {

            }))
    }

}

#Preview {
    SignUpView()
}
