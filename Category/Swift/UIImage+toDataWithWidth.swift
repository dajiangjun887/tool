//
//  UIImage+toDataWithWidth.swift
//  datademo
//
//  Created by apple on 2018/1/6.
//  Copyright © 2018年 apple. All rights reserved.
//

import Foundation

extension UIImage {
    func image(targetWidth: CGFloat) -> UIImage? {
        let imageSize = self.size;
        let width = imageSize.width;
        let height = imageSize.height;
        let targetHeight = (targetWidth / width) * height;
        
        UIGraphicsBeginImageContext(CGSize(width:targetWidth, height:targetHeight))
        draw(in: CGRect(x: 0, y: 0, width: targetWidth, height: targetHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage
    }
    
    func data(targetWidth: CGFloat) -> Data? {
        let targetImage = image(targetWidth: targetWidth)
        if let targetImage = targetImage {
            return UIImageJPEGRepresentation(targetImage, 1.0)
        }else {
            return nil
        }
    }
}
