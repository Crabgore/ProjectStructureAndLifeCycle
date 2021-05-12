//
//  AppConfiguration.swift
//  Navigation
//
//  Created by Mihail on 12.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration {
    case people(people: URL)
    case starships(starship: URL)
    case planets(planet: URL)
    
    static func random(people: URL, starship: URL, planet: URL) -> AppConfiguration {
        let all: [AppConfiguration] = [.people(people: people),
                                    .starships(starship: starship),
                                    .planets(planet: planet)]
        let randomIndex = Int(arc4random()) % all.count
        return all[randomIndex]
    }
}
