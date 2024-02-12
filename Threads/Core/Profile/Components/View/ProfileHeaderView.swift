//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user : User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.userName ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                    
                }
                
                Text("2 Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }

    }
}

#Preview {
    ProfileHeaderView(user: User(id: NSUUID().uuidString, email: "omkar@gmail.com", userName: "itzz_omiii__07", fullName: "Omkar anarse"))
}
