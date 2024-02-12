//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Firebase
import FirebaseAuth

class CreateThreadViewModel: ObservableObject {

    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timeStamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
