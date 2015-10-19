//
//  IndexHelloLabel.swift
//  eduadmin
//
//  Created by Li Jie on 10/19/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class IndexHelloLabel: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.numberOfLines = 0
        
        let helloArr = ["大象无形，大音希声，大方无隅，大器免成", "枪打出头鸟，很大程度上是挑飞得低的打", "不想立志环游世界的码农不是好董事长", "i zuo i die i still try", "高中就是个扯淡的地方，几个月就能完成的学业，非要熬三年", "像素级强迫症患者晚期"]
        
        self.text = helloArr[CommonTools.randomInRange(0...5)]
    }

}
