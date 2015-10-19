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
        
//        if NSFileManager.defaultManager().fileExistsAtPath(Constants.UserInfoFilePath.USER_INFO_PATH) {
//            
//            let dict = NSDictionary.init(contentsOfFile: Constants.UserInfoFilePath.USER_INFO_PATH)!
//            
//            if NSFileManager.defaultManager().fileExistsAtPath(Constants.UserInfoFilePath.USER_PHOTO_PATH) {
//                
//                self.image = UIImage.cropCircleImageWithBorder(UIImage.init(contentsOfFile: Constants.UserInfoFilePath.USER_PHOTO_PATH)!, borderWidth: 3, borderColor: UIColor.grayColor())
//            } else {
//                
//                let urlStr = dict["photoUrl"] as! String
//                
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
//                    
//                    let getImage =  UIImage(data: NSData(contentsOfURL: NSURL(string: urlStr)!)!)
//                    
//                    UIImagePNGRepresentation(getImage!)!.writeToFile(Constants.UserInfoFilePath.USER_PHOTO_PATH, atomically: true)
//                    
//                    dispatch_async(dispatch_get_main_queue()) {
//                        
//                        self.image = UIImage.cropCircleImageWithBorder(getImage!, borderWidth: 3, borderColor: UIColor.grayColor())
//                        return
//                    }
//                }
//                
//            }
//        } else {
//            
//            self.image = UIImage.cropCircleImageWithBorder(UIImage(named: "avatar")!, borderWidth: 3, borderColor: UIColor.grayColor())
//        }
        self.image = UIImage.cropCircleImageWithBorder(UIImage(named: "avatar")!, borderWidth: 3, borderColor: UIColor.grayColor())
    }
}
