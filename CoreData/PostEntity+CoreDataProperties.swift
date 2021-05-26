//
//  PostEntity+CoreDataProperties.swift
//  Navigation
//
//  Created by Mihail on 26.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//
//

import Foundation
import CoreData


extension PostEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostEntity> {
        return NSFetchRequest<PostEntity>(entityName: "PostEntity")
    }

    @NSManaged public var author: String?
    @NSManaged public var descript: String?
    @NSManaged public var image: String?
    @NSManaged public var likes: Int64
    @NSManaged public var views: Int64
    @NSManaged public var id: UUID

}

extension PostEntity : Identifiable {

}
