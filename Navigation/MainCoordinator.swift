//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Mihail on 12.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    enum Strings: String {
        case profile
        case feed
        
        var localized: String {
            return NSLocalizedString(rawValue, comment: "")
        }
    }
    
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?
    
    init(navigationController: UINavigationController?, tabBarController: UITabBarController?) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func start() {
        let profileVC = LogInViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController, tabBarController: nil)
        let profile = UITabBarItem(title: Strings.profile.localized, image:UIImage(systemName: "person") , tag: 0)
        profileVC.delegate = LoginInspector()
        profileVC.coordinator = profileCoordinator
        profileVC.tabBarItem = profile
        
        let feedVC = FeedViewController(output: PostPresenter())
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        let feed = UITabBarItem(title: Strings.feed.localized, image: UIImage(systemName: "info.circle"), tag: 1)
        feedVC.coordinator = FeedCoordinator(navigationController: feedNavigationController, tabBarController: nil)
        feedVC.tabBarItem = feed

        tabBarController?.viewControllers = [profileNavigationController, feedNavigationController]
    }
}
