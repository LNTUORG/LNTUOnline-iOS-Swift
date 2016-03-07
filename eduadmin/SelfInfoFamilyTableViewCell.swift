//
//  SelfInfoFamilyTableViewCell.swift
//  eduadmin
//
//  Created by Li Jie on 3/7/16.
//  Copyright © 2016 PUPBOSS. All rights reserved.
//

import UIKit

class SelfInfoFamilyTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var politicalAffiliationLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var workLocationLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
