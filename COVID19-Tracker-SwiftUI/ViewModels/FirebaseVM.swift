//
//  FirebaseVM.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/19/21.
//

import FirebaseAuth

// Code from: https://www.youtube.com/watch?v=vPCEIPL0U_k&t=15s

class AppViewModel: ObservableObject {
    
    @Published var loggedIn = false

    var isLoggedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.loggedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.loggedIn = true
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.loggedIn = false
    }
    
}
