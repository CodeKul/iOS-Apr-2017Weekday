//
//  studentTableViewCell.swift
//  coreDataWithNavigation
//
//  Created by Codekul on 29/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class studentTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var lblAge: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
