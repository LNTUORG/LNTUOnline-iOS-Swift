//
//  LoginViewController.swift
//  eduadmin
//
//  Created by Li Jie on 10/16/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    var userId = ""
    var password = ""
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "veins")!)
        
        if (CommonTools.getUserDefaultValueForKey(Constants.UserInfo.USER_NAME_KEY) == nil || CommonTools.getUserDefaultValueForKey(Constants.UserInfo.PASSWORD_KEY) == nil) {
            
        } else {
            
            userId = (CommonTools.getUserDefaultValueForKey(Constants.UserInfo.USER_NAME_KEY) as? String)!
            password = (CommonTools.getUserDefaultValueForKey(Constants.UserInfo.PASSWORD_KEY) as? String)!
            
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
            
            return
        }
        
        CommonTools.storeUserDefaultValueForKey(Constants.UserInfo.USER_NAME_KEY, value: self.userNameTextField.text!)
        CommonTools.storeUserDefaultValueForKey(Constants.UserInfo.PASSWORD_KEY, value: self.passwordTextField.text!)
        
        let param = [
            "userId": self.userId,
            "password": self.password
        ]
        
        Alamofire.request(.POST, Constants.ROOT_URL + "account/login", parameters: param).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            MBProgressHUD.hideHUD()
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if response.response?.statusCode == 400 {
                    
                    MBProgressHUD.showError("用户密码错误")
                    
                } else {
                    
                    if dict["userType"] as! String == "STUDENT" {
                        
                        CommonTools.storeUserDefaultValueForKey(Constants.UserInfo.LOGIN_TOKEN_KEY, value: dict["loginToken"] as! String)
                        CommonTools.storeUserDefaultValueForKey(Constants.UserInfo.EXPRES_AT_KEY, value: dict["expiresAt"] as! String)
                        MBProgressHUD.showSuccess("登录成功")
                        self.dismissViewControllerAnimated(true, completion: nil)
                        
                    } else {
                        
                        MBProgressHUD.showError("暂不支持教师用户")
                    }
                }
                
            } else {
                
                print(response)
                MBProgressHUD.showError(Constants.Notification.NETERROR)
            }
        }
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
