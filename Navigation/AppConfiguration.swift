//
//  AppConfiguration.swift
//  Navigation
//
//  Created by Mihail on 06.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration {
    case people(people: URL)
    case starships(starship: URL)
    case planets(planet: URL)
}
