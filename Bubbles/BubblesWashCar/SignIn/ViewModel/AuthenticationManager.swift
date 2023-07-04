//
//  AuthenticationManager.swift
//  Bubbles
//
//  Created by Lara K on 02/12/1444 AH.
//


import Foundation
import FirebaseAuth

struct AuthDataResultViewModel {

    
    let uid: String
    let email: String?
//    let fullName: String?
//    let vehicleName: String?
//    let model: String?
//    let plate: String?
//    let color: String?


    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
//        self.fullName = user.displayName
//        self.vehicleName = user.displayName
//        self.model = user.displayName
//        self.plate = user.displayName
//        self.color = user.displayName
        
        
    }
}
    
   final class AuthenticationManager {
        
        static let shared = AuthenticationManager()
        private init() {}
        
        func createUser(email: String, password: String) async throws -> AuthDataResultViewModel {
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            return AuthDataResultViewModel(user: authDataResult.user)
    }
}
