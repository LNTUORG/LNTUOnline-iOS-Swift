//
//  SelfInfoHeaderTableViewCell.swift
//  eduadmin
//
//  Created by Li Jie on 3/7/16.
//  Copyright © 2016 PUPBOSS. All rights reserved.
//

import UIKit

protocol SelfInfoHeaderViewDelegate: class {
    
    func headerViewDidClicked(headerView: SelfInfoHeaderTableViewCell)
    
}

class SelfInfoHeaderTableViewCell: UITableViewCell {

    @IBOutlet var titleButton: UIButton!
    weak var delegate: SelfInfoHeaderViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
