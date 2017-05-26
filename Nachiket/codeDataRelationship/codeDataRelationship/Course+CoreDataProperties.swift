//
//  Course+CoreDataProperties.swift
//  codeDataRelationship
//
//  Created by Codekul on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var cName: String?
    @NSManaged public var courseToStudent: NSSet?

}

// MARK: Generated accessors for courseToStudent
extension Course {

    @objc(addCourseToStudentObject:)
    @NSManaged public func addToCourseToStudent(_ value: Student)

    @objc(removeCourseToStudentObject:)
    @NSManaged public func removeFromCourseToStudent(_ value: Student)

    @objc(addCourseToStudent:)
    @NSManaged public func addToCourseToStudent(_ values: NSSet)

    @objc(removeCourseToStudent:)
    @NSManaged public func removeFromCourseToStudent(_ values: NSSet)

}
