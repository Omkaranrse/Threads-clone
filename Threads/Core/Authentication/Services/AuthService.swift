//
//  AuthService.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("DEBUG: Created user:- \(result.user.uid)")
            print("DEBUG: User Loged in Successfully🥳")
        }catch{
            print("DEBUG: Error occured:- \(error.localizedDescription)")
        }

    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(id: result.user.uid, email: email, fullName: fullName, userName: userName)
            print("DEBUG: Created user:- \(result.user.uid)")
            print("DEBUG: User Created Successfully🥳")
        }catch{
            print("DEBUG: Error occured:- \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut() // sign out on backend
        self.userSession = nil //this remove userSession locally and updates routing 
        UserService.shared.reset()
    }
    
    @MainActor
    func uploadUserData(id: String, email: String, fullName: String, userName: String) async {
        do {
            let user = User(id: id, email: email, userName: userName, fullName: fullName)
            let userData = try Firestore.Encoder().encode(user)
            
            let documentReference = Firestore.firestore().collection("users").document(id)
            try await documentReference.setData(userData)
            UserService.shared.currentUser = user
            
            print("DEBUG: User data uploaded successfully for user: \(id)")
        } catch {
            print("DEBUG: Error uploading user data for user \(id): \(error.localizedDescription)")
        }
    }

}
