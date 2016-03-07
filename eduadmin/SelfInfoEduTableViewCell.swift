//
//  SelfInfoEduTableViewCell.swift
//  eduadmin
//
//  Created by Li Jie on 3/7/16.
//  Copyright © 2016 PUPBOSS. All rights reserved.
//

import UIKit

class SelfInfoEduTableViewCell: UITableViewCell {

    @IBOutlet var startTimeLabel: UILabel!
    @IBOutlet var endTimeLabel: UILabel!
    @IBOutlet var schoolInfoLabel: UILabel!
    @IBOutlet var witnessLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
