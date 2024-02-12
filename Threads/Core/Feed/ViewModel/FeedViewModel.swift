//
//  FeedViewModel.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init(){
        Task{ try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThread()
    }
    
    private func fetchUserDataForThread() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
