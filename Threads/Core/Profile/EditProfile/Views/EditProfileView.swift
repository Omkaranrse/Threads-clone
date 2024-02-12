//
//  EditProfileView.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    @State private var bio : String = ""
    @State private var link : String = ""
    @State private var isPrivateProfile : Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewmodel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack{
                    //name & profile pic
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullName)
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Bio").fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Link").fontWeight(.semibold)
                        
                        TextField("Add link...", text: $link)
                    }
                    
                    Divider()

                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                })
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done"){
                        Task{ try await viewModel.updateUserData() }
                        dismiss()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            })
        }
    }
}

#Preview {
    EditProfileView(user: User(id: NSUUID().uuidString, email: "omkar@gmail.com", userName: "itzz_omiii__07", fullName: "Omkar anarse"))
}
