//
//  UIImage+toDataWithMaxLength.swift
//  color
//
//  Created by apple on 2018/1/6.
//  Copyright © 2018年 apple. All rights reserved.
//

import Foundation

extension UIImage {
    func data(maxLength: Int) -> Data? {
        let originData = UIImageJPEGRepresentation(self, 1)
        guard let data = originData else {
            return nil
        }
        if (data as NSData).length < maxLength {
            return data
        }else {
            return UIImageJPEGRepresentation(self, CGFloat(maxLength)/CGFloat((data as NSData).length))
        }
    }
}
