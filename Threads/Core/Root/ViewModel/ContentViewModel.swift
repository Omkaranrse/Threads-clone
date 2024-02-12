//
//  ContentViewmodel.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Foundation
import Combine
import Firebase

class ContentViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setUpSubscribers()
    }
    
    private func setUpSubscribers(){
        AuthService.shared.$userSession.sink { [ weak self ] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
