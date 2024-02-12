//
//  LoginViewModel.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }

}
