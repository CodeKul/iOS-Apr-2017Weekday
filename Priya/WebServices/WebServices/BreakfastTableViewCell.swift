//
//  BreakfastTableViewCell.swift
//  WebServices
//
//  Created by Varun on 27/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class BreakfastTableViewCell: UITableViewCell {

    @IBOutlet var name : UITextField!
    @IBOutlet var price : UITextField!
    @IBOutlet var desc : UITextField!
    @IBOutlet var cal : UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
