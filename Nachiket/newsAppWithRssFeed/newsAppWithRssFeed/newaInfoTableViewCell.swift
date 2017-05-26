//
//  newaInfoTableViewCell.swift
//  newsAppWithRssFeed
//
//  Created by Codekul on 25/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class newaInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var lblPubDate: UILabel!
    @IBOutlet weak var lblLink: UILabel!
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
