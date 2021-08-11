//
//  LocalAuthorizationService.swift
//  Navigation
//
//  Created by Mihail on 11.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import LocalAuthentication

class LocalAuthorizationService {
    let laContext = LAContext()
    var error: NSError?
    
    func canUseBiometric() -> Bool {
        
    let acces = laContext.canEvaluatePolicy(
        .deviceOwnerAuthenticationWithBiometrics,
        error: &error
    )
        print("scces is \(acces)")
        print("error is \(error)")
        return acces
    }
    
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool) -> Void) {
        if canUseBiometric() {
            laContext.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "To access data"
            ) { success, error in
                if let error = error {
                    print("Try another method, \(error.localizedDescription)")
                    return
                }

                authorizationFinished(true)
            }
        }
    }
}
