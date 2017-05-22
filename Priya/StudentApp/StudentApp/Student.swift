//
//  Student.swift
//  StudentApp
//
//  Created by Abhi on 02/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation

class Student: NSObject, NSCoding {
    
    var rollNo : Int?
    var name : String?
    var marks : Double?
    var city : String?
    
    required init?(coder aDecoder: NSCoder) {

    }
    
    func encode(with aCoder: NSCoder) {
        
    }
    
    init(rollNo: Int, name : String, marks : Double, city : String) {
        
        self.rollNo = rollNo
        self.name = name
        self.marks = marks
        self.city = city
        
    }
}
