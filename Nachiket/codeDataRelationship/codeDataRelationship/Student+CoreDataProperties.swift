//
//  Student+CoreDataProperties.swift
//  codeDataRelationship
//
//  Created by Codekul on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var sName: String?
    @NSManaged public var std: String?
    @NSManaged public var studentToCourse: Course?

}
