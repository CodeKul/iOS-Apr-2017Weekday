//
//  NewsPaperTableViewCell.swift
//  XMLParsingRSS
//
//  Created by Varun on 30/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class NewsPaperTableViewCell: UITableViewCell {

    @IBOutlet var txtNewsPaper : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
