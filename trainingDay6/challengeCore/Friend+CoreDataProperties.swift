//
//  Friend+CoreDataProperties.swift
//  challengeCore
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    
    public var wrappedId: String {
        id ?? "Unknown ID"
    }

    public var wrappedName: String {
        name ?? "Unknown Name"
    }

}
