//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Mihail on 12.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    enum Strings: String {
        case incorrectData
        case shortPassword
        case incorrectEmail
        case error
        case OK
        
        var localized: String {
            return NSLocalizedString(rawValue, comment: "")
        }
    }
    
    var tabBarController: UITabBarController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController, tabBarController: UITabBarController?) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func loginButtonPressed() {
        let profile = ProfileViewController()
        profile.coordinator = self
        navigationController?.pushViewController(profile, animated: true)
    }
    
    func closeButtonPressed() {
        navigationController?.popViewController(animated: true)
        
    }
    
    func photosSelected() {
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    func showAlert(error: Errors) {
        var message = ""
        switch error {
        case .incorrectData:
            message = Strings.incorrectData.localized
        case .shortPassword:
            message = Strings.shortPassword.localized
        case .incorrectEmail:
            message = Strings.incorrectEmail.localized
        }
        
        let alertController = UIAlertController(title: Strings.error.localized, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Strings.OK.localized, style: .default) { _ in
            print("OK")
        }
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}
