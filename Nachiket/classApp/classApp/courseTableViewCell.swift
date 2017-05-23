//
//  courseTableViewCell.swift
//  classApp
//
//  Created by Codekul on 22/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class courseTableViewCell: UITableViewCell {

    @IBOutlet weak var txtName : UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
