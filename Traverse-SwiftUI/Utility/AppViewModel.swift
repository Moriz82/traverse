//
//  AppViewModel.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/28/22.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func login(email: String, password: String){
        auth.signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            //Success
            DispatchQueue.main.async{
                self?.signedIn = true
            }
            
        })
    }
        
    func signup(name: String, email: String, password: String){
        auth.createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
}
