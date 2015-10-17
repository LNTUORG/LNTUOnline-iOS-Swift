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
            })
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        self.performSegueWithIdentifier("nav2login", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
