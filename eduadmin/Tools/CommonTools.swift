//
//  CommonTools.swift
//  eduadmin
//
//  Created by Li Jie on 10/16/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class CommonTools: NSObject {

    /**
    return a random
    
    - parameter range: such as 0...6
    
    - returns: a count
    */
    class func randomInRange(range: Range<Int>) -> Int {
        
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
    }
}
