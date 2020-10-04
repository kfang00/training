//
//  User+CoreDataProperties.swift
//  challengeCore
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var friends: [Friend]?
    
    public var wrappedId: String {
        id ?? "Unknown ID"
    }

    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    
    public var wrappedCompany: String {
        company ?? "Unknown Company"
    }
    
    
    public var wrappedEmail: String {
        email ?? "Unknown Email"
    }
    
    
    public var wrappedAddress: String {
        address ?? "Unknown Address"
    }
    
    public var wrappedAbout: String {
        about ?? "No Description"
    }
    
    public var wrappedFriend: [Friend] {
        friends ?? [Friend]()
    }
    
    

}
