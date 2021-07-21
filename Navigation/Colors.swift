//
//  Colors.swift
//  Navigation
//
//  Created by Mihail on 21.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

let LIGHT = 0
let DARK = 1

func getBackgroundColor(theme: UITraitCollection) -> UIColor {
    switch theme.userInterfaceStyle {
    case .dark:
        return .darkGray
    default:
        return .white
    }
}
