//
//  Checker.swift
//  Navigation
//
//  Created by Mihail on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

struct Checker {
    static let shared = Checker()
    let login = "free"
    let password = "caravan"
    
    private init() {
        
    }
    
    func check(userLogin: String?, userPass: String?) -> Bool {
        if userLogin == login || userPass == password {
            return true
        }
        return false
    }
}
