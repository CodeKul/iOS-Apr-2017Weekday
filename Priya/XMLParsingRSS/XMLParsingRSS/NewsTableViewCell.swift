//
//  NewsTableViewCell.swift
//  XMLParsingRSS
//
//  Created by Codekul on 07/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var lblPubDate: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
