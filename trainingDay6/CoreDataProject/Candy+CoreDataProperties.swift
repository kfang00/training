//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Kayla Fang on 10/3/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}
