//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Mihail on 12.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    
    enum Strings: String {
        case post
        case deletePost
        case deletePostConfirm
        case cancel
        case delete
        
        var localized: String {
            return NSLocalizedString(rawValue, comment: "")
        }
    }
    
    var tabBarController: UITabBarController?
    var navigationController: UINavigationController?
    var infoVC: InfoViewController?
    
    init(navigationController: UINavigationController, tabBarController: UITabBarController?) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func showPost() {
        let controller = PostViewController()
        controller.post = Strings.post.localized
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func presentPost() {
        infoVC = InfoViewController()
        infoVC?.coordinator = self
        navigationController?.present(infoVC!, animated: true)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: Strings.deletePost.localized, message: Strings.deletePostConfirm.localized, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Strings.cancel.localized, style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: Strings.delete.localized, style: .destructive) { _ in
            print("Удалить")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        infoVC?.present(alertController, animated: true, completion: nil)
    }
}
