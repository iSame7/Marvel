//
//  UIImage+Decompression.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/17/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

extension UIImage {

    var decompressedImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        drawAtPoint(CGPointZero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage
    }
    
}
