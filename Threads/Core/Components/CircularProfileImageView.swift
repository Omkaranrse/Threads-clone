//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize{
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xlarge
    
    var dimension: CGFloat{
        switch self {
        case .xxSmall: return 28
        case .xSmall:return 32
        case .small:return 40
        case .medium:return 48
        case .large:return 64
        case .xlarge:return 80
        }
    }
}

struct CircularProfileImageView: View {
    
    var user: User?
    let size: ProfileImageSize
        
    var body: some View {
        if let imageUrl = user?.profileImageUrl{
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User(id: NSUUID().uuidString, email: "omkar@gmail.com", userName: "itzz_omiii__07", fullName: "Omkar anarse"), size: .medium)
}
