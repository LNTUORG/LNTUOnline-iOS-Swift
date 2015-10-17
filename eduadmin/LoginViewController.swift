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
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "veins")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Actions
    
    
    @IBAction func loginAction() {
        
        CommonTools.storeUserDefaultValueForKey(Constants.UserInfo.USER_NAME_KEY, value: self.userNameTextField.text!)
        CommonTools.storeUserDefaultValueForKey(Constants.UserInfo.PASSWORD_KEY, value: self.passwordTextField.text!)
        
        let param = [
            "userId": self.userNameTextField.text!,
            "password": self.passwordTextField.text!
        ]
        
        Alamofire.request(.POST, Constants.ROOT_URL + "account/login", parameters: param).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            switch response.result {
                
            case .Success:
                
                print(response)

            case .Failure(let error):
                print(error)
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
