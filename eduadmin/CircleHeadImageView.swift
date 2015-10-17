//
//  CircleHeadImageView.swift
//  eduadmin
//
//  Created by Li Jie on 10/17/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class CircleHeadImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.image = UIImage.cropCircleImageWithBorder(UIImage(named: "avatar")!, borderWidth: 3, borderColor: UIColor.grayColor())
    }
}
