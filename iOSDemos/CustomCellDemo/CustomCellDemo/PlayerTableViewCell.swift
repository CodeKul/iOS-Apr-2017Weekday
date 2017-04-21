//
//  PlayerTableViewCell.swift
//  CustomCellDemo
//
//  Created by Varun on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var ageLbl: UILabel!
    @IBOutlet var scoreLbl: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var infoButton : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
