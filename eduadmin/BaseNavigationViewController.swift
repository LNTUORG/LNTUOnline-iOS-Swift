//
//  BaseNavigationViewController.swift
//  eduadmin
//
//  Created by Li Jie on 10/16/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Launch Image
        
        let launchImageView = UIImageView.init(frame: self.view.frame)
        
        launchImageView.image = UIImage.init(named: "startimg0" + String(CommonTools.randomInRange(0...5)))
        
        self.view.addSubview(launchImageView)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            
            UIView.animateWithDuration(0.9, animations: { () -> Void in
                
                launchImageView.alpha = 0.0;
                }, completion: { (Bool) -> Void in
                    
                    launchImageView.removeFromSuperview()
                    
                    if "" == Constants.LOGIN_TOKEN {
                        
                        self.performSegueWithIdentifier("nav2login", sender: nil)
                        
                    } else {
                        
                    }
            })
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
