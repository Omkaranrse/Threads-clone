//
//  ProfileView.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button(action: {}, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                
                UserContentListView(user: user)
            }
        }
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView(user: User(id: NSUUID().uuidString, email: "omkar@gmail.com", userName: "itzz_omiii__07", fullName: "Omkar anarse"))
}
