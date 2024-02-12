//
//  UserCell.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct UserCell: View {
    
    let user : User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2){
                Text(user.userName).fontWeight(.semibold)
                Text(user.fullName)
            }.font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4) ,lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: User(id: NSUUID().uuidString, email: "omkar@gmail.com", userName: "itzz_omiii__07", fullName: "Omkar anarse"))
}