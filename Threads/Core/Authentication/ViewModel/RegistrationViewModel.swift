//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import SwiftUI

class RegistrationViewModel: ObservableObject{
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var fullName : String = ""
    @Published var userName : String = ""

    
    @MainActor
    func createUser() async throws{
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullName: fullName,
            userName: userName
        )
    }
}
