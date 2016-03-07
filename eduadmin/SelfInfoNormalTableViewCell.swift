//
//  SelfInfoNormalTableViewCell.swift
//  eduadmin
//
//  Created by Li Jie on 3/7/16.
//  Copyright © 2016 PUPBOSS. All rights reserved.
//

import UIKit

class SelfInfoNormalTableViewCell: UITableViewCell {

    
    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
