//
//  LoginInspector.swift
//  Navigation
//
//  Created by Mihail on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    
    func checkLogin(userLogin: String) -> Bool {
        return Checker.shared.check(userLogin: userLogin, userPass: nil)
    }
    
    func checkPass(userPass: String) -> Bool {
        return Checker.shared.check(userLogin: nil, userPass: userPass)
    }
}
