//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI

class CurrentUserProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setUpSubscribers()
    }
    
    func setUpSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
    }
    
}

