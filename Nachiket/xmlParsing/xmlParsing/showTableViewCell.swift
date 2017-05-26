//
//  showTableViewCell.swift
//  xmlParsing
//
//  Created by Codekul on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class showTableViewCell: UITableViewCell {
    @IBOutlet weak var txtDesc: UILabel!
    @IBOutlet weak var txtCal: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    @IBOutlet weak var txtName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
