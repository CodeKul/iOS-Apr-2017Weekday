//
//  Student+CoreDataProperties.swift
//  coreDataDemoClass
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var marks: Int32
    @NSManaged public var name: String?
    @NSManaged public var rno: Int32

}
