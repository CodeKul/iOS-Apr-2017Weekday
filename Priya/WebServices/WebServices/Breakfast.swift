//
//  Breakfast.swift
//  WebServices
//
//  Created by Varun on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
class Breakfast: NSObject, NSCoding {

    var name : String?
    var price : Double?
    var desc : String?
    var cal : Int?
    
    required init?(coder aDecoder: NSCoder) {
        
    }
    
    func encode(with aCoder: NSCoder) {
        
    }
    
    init (name : String, price : Double, desc : String, cal : Int) {
        
        self.name = name
        self.price = price
        self.desc = desc
        self.cal = cal
        
    }
}
