//
//  StudentTableViewCell.swift
//  CustomTableViewCell
//
//  Created by Varun on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet var imgPhoto: UIImageView!
    @IBOutlet var lblMarks: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblRoleNo: UILabel!
    @IBOutlet var infoButton: UIButton!
    
    override func awakeFromNib() {
     
       
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
