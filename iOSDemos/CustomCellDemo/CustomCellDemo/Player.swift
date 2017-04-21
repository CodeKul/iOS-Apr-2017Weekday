//
//  Player.swift
//  CustomCellDemo
//
//  Created by Varun on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation

class Player {
    
    var name : String
    var age : Int
    var score : Double
    var imageName : String
    
    init(name : String, age : Int, score : Double, imageName: String) {
        
        self.name = name
        self.age = age
        self.score = score
        self.imageName = imageName
    }
}
