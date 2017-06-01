//
//  allStudentTableViewCell.swift
//  classApp
//
//  Created by Codekul on 31/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class allStudentTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCOurse: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
