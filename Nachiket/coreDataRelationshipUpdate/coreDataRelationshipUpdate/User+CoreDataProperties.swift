//
//  User+CoreDataProperties.swift
//  coreDataRelationshipUpdate
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var address: NSSet?

}

// MARK: Generated accessors for address
extension User {

    @objc(addAddressObject:)
    @NSManaged public func addToAddress(_ value: Address)

    @objc(removeAddressObject:)
    @NSManaged public func removeFromAddress(_ value: Address)

    @objc(addAddress:)
    @NSManaged public func addToAddress(_ values: NSSet)

    @objc(removeAddress:)
    @NSManaged public func removeFromAddress(_ values: NSSet)

}
