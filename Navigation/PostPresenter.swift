//
//  PostPresenter.swift
//  Navigation
//
//  Created by Mihail on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class PostPresenter: FeedViewOutput {
    var navigationController: UINavigationController?
    
    
    func showPost() {
        let controller = PostViewController()
        controller.post = "Post"
        navigationController?.pushViewController(controller, animated: true)
    }
}
