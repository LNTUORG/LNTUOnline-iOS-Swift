//
//  CommonTools.swift
//  eduadmin
//
//  Created by Li Jie on 10/16/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

struct Constants {
    
    static let ROOT_URL = "https://api.online.lntu.org/"
    static let LOGIN_TOKEN = CommonTools.valueForKey(Constants.UserInfo.LOGIN_TOKEN_KEY)
    
    struct UserInfo {
        static let EXPRES_AT_KEY = "EXPRES_AT"
        static let LOGIN_TOKEN_KEY = "LOGIN_TOKEN"
        static let USER_NAME_KEY = "USER_NAME"
        static let PASSWORD_KEY = "PASSWORD"
    }
    
    struct NotificationKey {
        
        static let Welcome = "kWelcomeNotif"
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
}

class CommonTools: NSObject {

    // MARK: - Constants
    
    
    // MARK: - Common methods
    
    /**
    return a random
    
    - parameter range: such as 0...6
    
    - returns: a count
    */
    class func randomInRange(range: Range<Int>) -> Int {
        
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
    }
    
    
    // MARK: - UserDefault methods
    
    class func storeUserDefaultValueForKey(key: String, value: String) -> Void {
    
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setValue(value, forKey: key)
        userDefaults.synchronize()
    }
    
    class func getUserDefaultValueForKey(key: String) -> String {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.valueForKey(key) as! String
    }
}
