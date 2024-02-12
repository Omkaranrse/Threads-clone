//
//  CurrentUserProfileView.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State private var showEditProfile = false
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    @State private var selectedFilter : ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var fliterBarWidth : CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 32)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4) ,lineWidth: 1)
                            }
                    })
                    
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser{
                    EditProfileView(user: user)
                }
            })
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }

                }
            }
        }

    }
}

#Preview {
    CurrentUserProfileView()
}
