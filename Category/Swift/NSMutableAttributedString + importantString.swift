//
//  NSAttributeString + importantString.swift
//  color
//
//  Created by apple on 2018/1/5.
//  Copyright © 2018年 apple. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    public convenience init(string: String, textColor: UIColor, fontSize: CGFloat = 14, starColor: UIColor = .red) {
        let starString = string + "*"
        self.init(string: starString)
        let font = UIFont.systemFont(ofSize: fontSize)
        self.setAttributes([.font : font], range: NSRangeFromString(self.string))
        self.setAttributes([.foregroundColor : textColor], range: NSRangeFromString(self.string))
        self.setAttributes([.foregroundColor : starColor], range: (self.string as NSString).range(of: "*"))
    }
    
}

