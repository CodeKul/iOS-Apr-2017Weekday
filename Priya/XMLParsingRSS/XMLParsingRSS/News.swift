//
//  News.swift
//  XMLParsingRSS
//
//  Created by Codekul on 07/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
class News: NSObject, NSCoding {
    
    var title : String?
    var desc : String?
    var pubDate : String?
    var link : String?
    
    required init?(coder aDecoder: NSCoder) {
        
    }
    
    func encode(with aCoder: NSCoder) {
        
    }
    
    init (title : String, desc : String, pubDate : String, link : String) {
        
        self.desc = desc
        self.title = title
        self.pubDate = pubDate
        self.link = link
        
    }
}
