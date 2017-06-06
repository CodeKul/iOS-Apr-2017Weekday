//
//  jobportal.swift
//  dashBoardDemo
//
//  Created by Codekul on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class jobportal: NSObject {
    var lblName :String
    var imageView :String
    //var bgcolor : String
    
    override init() {
        self.lblName = " "
        self.imageView = " "
        //self.bgcolor = " "
    }
    func setData(lblName : String,imageView : String)  {
        self.lblName = lblName
        self.imageView = imageView
        //self.bgcolor = bgcolor

    }
}
