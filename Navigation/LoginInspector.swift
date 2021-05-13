//
//  LoginInspector.swift
//  Navigation
//
//  Created by Mihail on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class LoginInspector: LoginViewControllerDelegate {
    func createNewUser(email: String, pass: String, failure: @escaping (Errors) -> Void) {
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            
            print("creation result: \(String(describing: authResult))")
            print("creation result user: \(String(describing: authResult?.user))")
            print("creationError: \(error?.localizedDescription)")
            
            if error != nil && error!.localizedDescription.contains("The password must be 6 characters long or more") {
                failure(.shortPassword)
            } else if error != nil && error!.localizedDescription.contains("The email address is badly formatted") {
                failure(.incorrectEmail)
            }
        }
    }
    
    func signIn(email: String, pass: String, failure: @escaping (Errors) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { authResult, error in
            
            print("auth result: \(String(describing: authResult))")
            print("auth result user: \(String(describing: authResult?.user))")
            print("error: \(String(describing: error?.localizedDescription))")
            
            if authResult?.user == nil {
                self.createNewUser(email: email, pass: pass, failure: failure)
            } else if error != nil {
                failure(.incorrectData)
            }
        }
    }
    
    func checkLogin(userLogin: String) -> Bool {
        return Checker.shared.check(userLogin: userLogin, userPass: nil)
    }
    
    func checkPass(userPass: String) -> Bool {
        return Checker.shared.check(userLogin: nil, userPass: userPass)
    }
}
