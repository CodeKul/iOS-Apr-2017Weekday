//
//  infoTableViewCell.swift
//  studentAppDemo
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class infoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblLName: UILabel!
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
