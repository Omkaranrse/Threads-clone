//
//  ThreadCell.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text(thread.user?.userName ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timeStamp.timeStampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                    }
                    
                    Text(thread.caption)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16){
                        Button(action: {}, label: {
                            Image(systemName: "heart")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "bubble.right")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

//#Preview {
//    ThreadCell(thread: Thread(ownerUid: "123", caption: "this is my thread", timeStamp: Timestamp(), likes: 0))
//}
