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
    
    static let LOGIN_TOKEN = CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.LOGIN_TOKEN_KEY)
    
    static let HEADER = ["Authorization": LOGIN_TOKEN]
    
    struct DeveloperInfo {
        
        static let QQ = "10771533"
    }
    
    struct UserInfo {
        
        static let USER_NAME = CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.USER_NAME_KEY)
    }
    
    struct UserInfoFilePath {
        
        static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String + "/"
        static let Tmp = NSTemporaryDirectory()
        static let USER_INFO_PATH = Documents + UserInfo.USER_NAME + "SelfInfo.plist"
        static let USER_PHOTO_PATH = Documents + UserInfo.USER_NAME + "SelfIcon.png"
    }
    
    struct UserInfoKey {
        static let EXPRES_AT_KEY = "EXPRES_AT"
        static let LOGIN_TOKEN_KEY = "LOGIN_TOKEN"
        static let USER_NAME_KEY = "USER_NAME"
        static let PASSWORD_KEY = "PASSWORD"
    }
    
    struct Notification {
        
        static let LOADING = "正在加载中..."
        static let NET_ERROR = "服务器被外星人搬走了o(╯□╰)o"
        static let NULL_ERROR = "暂无此类数据"
        static let PASSWORD_ERROR = "用户密码错误"
        static let TOKEN_ERROR = "授权已过期请重新登录"
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
        
        if (userDefaults.valueForKey(key) == nil) {
            
            return ""
        } else {
            
            return userDefaults.valueForKey(key) as! String
        }
    }
}
