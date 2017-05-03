//
//  Student.swift
//  CustomTableViewCell
//
//  Created by Varun on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation

class student {
    var studentName : String
    var roleNo : Int
    var marks : Double
    var grade : Int
    var photo : String
    
    init(studentName : String, roleNo : Int, marks : Double, grade : Int, photo : String){
    
        self.studentName = studentName
        self.roleNo = roleNo
        self.marks = marks
        self.grade = grade
        self.photo = photo
    }
}
