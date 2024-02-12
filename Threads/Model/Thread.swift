//
//  Thread.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadID : String?
    let ownerUid: String
    let caption: String
    let timeStamp: Timestamp
    var likes: Int
    
    var user: User?
    
    var id: String {
        return threadID ?? NSUUID().uuidString
    }
}
