//
//  LoginViewController.swift
//  eduadmin
//
//  Created by Li Jie on 10/16/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController {
    
    var userId = ""
    var password = ""
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.USER_NAME_KEY) == "" || CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.PASSWORD_KEY) == "") {
            
        } else {
            
            userId = CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.USER_NAME_KEY)
            password = CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.PASSWORD_KEY)
            
            self.userNameTextField.text = userId
            self.passwordTextField.text = password
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Actions
    
    
    @IBAction func askForHelp() {
        
        let url = NSURL(string: ("http://wpa.qq.com/msgrd?v=3&uin=" + Constants.DeveloperInfo.QQ + "&site=qq&menu=yes"))
        
        UIApplication.sharedApplication().openURL(url!)
    }
    
    @IBAction func exitEditing() {
        
        self.view.endEditing(true)
    }
    
    @IBAction func loginAction() {
        
        MBProgressHUD.showMessage(Constants.Notification.LOADING)
        
        self.userId = self.userNameTextField.text!
        self.password = self.passwordTextField.text!
        
        if (self.userId.length + self.password.length <= 7) {
            
            MBProgressHUD.showError("补全信息后再登录")
            return
        }
        
        CommonTools.storeUserDefaultValueForKey(Constants.UserInfoKey.USER_NAME_KEY, value: self.userNameTextField.text!)
        CommonTools.storeUserDefaultValueForKey(Constants.UserInfoKey.PASSWORD_KEY, value: self.passwordTextField.text!)
        
        let param = [
            "userId": self.userId,
            "password": self.password
        ]
        
        Alamofire.request(.POST, Constants.ROOT_URL + "account/login", parameters: param).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            MBProgressHUD.hideHUD()
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if response.response?.statusCode == 400 {
                    
                    MBProgressHUD.showError(Constants.Notification.PASSWORD_ERROR)
                    
                } else {
                    
                    if dict["userType"] as! String == "STUDENT" {
                        
                        CommonTools.storeUserDefaultValueForKey(Constants.UserInfoKey.LOGIN_TOKEN_KEY, value: dict["loginToken"] as! String)
                        CommonTools.storeUserDefaultValueForKey(Constants.UserInfoKey.EXPRES_AT_KEY, value: dict["expiresAt"] as! String)
                        MBProgressHUD.showSuccess("登录成功")
                        self.dismissViewControllerAnimated(true, completion: nil)
                        
                    } else {
                        
                        MBProgressHUD.showError("暂不支持教师用户")
                    }
                }
                
            } else {
                
                MBProgressHUD.showError(Constants.Notification.NET_ERROR)
            }
        }
    }
}
