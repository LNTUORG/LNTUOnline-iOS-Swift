//
//  IndexViewController.swift
//  eduadmin
//
//  Created by Li Jie on 10/16/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class IndexViewController: BaseViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.alwaysBounceVertical = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setPhotoAndName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setPhotoAndName() -> Void {
        
        if "" == Constants.LOGIN_TOKEN {
            
        } else {
            
            if NSFileManager.defaultManager().fileExistsAtPath(Constants.UserInfoFilePath.USER_INFO_PATH) {
                
                let dict = NSDictionary.init(contentsOfFile: Constants.UserInfoFilePath.USER_INFO_PATH)!
                
                self.nameLabel.text = (dict["name"] as? String)! + "，你好"
            } else {
                
                Alamofire.request(.GET, Constants.ROOT_URL + "student/~self", headers: Constants.HEADER).responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                    
                    if let dict = response.result.value as? Dictionary<String, AnyObject> {
                        
                        if response.response?.statusCode == 401 {
                            
                            MBProgressHUD.showError(Constants.Notification.TOKEN_ERROR)
                        }
                        if response.response?.statusCode == 400 {
                            
                            MBProgressHUD.showError(Constants.Notification.PASSWORD_ERROR)
                            
                        } else {
                            
                            NSDictionary(dictionary: dict).writeToFile(Constants.UserInfoFilePath.USER_INFO_PATH, atomically: true)
                            
                            self.nameLabel.text = (dict["name"] as? String)! + "，你好"
                        }
                    }  else {
                        
                        MBProgressHUD.showError(Constants.Notification.NET_ERROR)
                    }
                })
            }
        }
    }

}
