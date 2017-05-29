//
//  Address+CoreDataProperties.swift
//  coreDataRelationshipUpdate
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var homeAddress: String?
    @NSManaged public var user: NSSet?

}

// MARK: Generated accessors for user
extension Address {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}
