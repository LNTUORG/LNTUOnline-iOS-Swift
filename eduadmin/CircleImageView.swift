//
//  CircleImageView.swift
//  eduadmin
//
//  Created by Li Jie on 10/17/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let avatar = UIImage(named: "avatar")!
        
        self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 3
        self.image = avatar
    }
}
