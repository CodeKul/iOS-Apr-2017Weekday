//
//  nationInfoTableViewCell.swift
//  jasonParsning
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class nationInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblalpha3code: UILabel!
    @IBOutlet weak var lblalpha2code: UILabel!
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
