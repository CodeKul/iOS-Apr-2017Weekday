//
//  Class+CoreDataProperties.swift
//  coreDataDemoClass
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var std: Int32

}
