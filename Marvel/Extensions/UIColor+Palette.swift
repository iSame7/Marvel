//
//  UIColor.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/17/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

extension UIColor {

    class func colorFromRGB(r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(Float(r) / 255), green: CGFloat(Float(g) / 255), blue: CGFloat(Float(b) / 255), alpha: 1)
    }

    class func palette() -> [UIColor] {
        let palette = [
            UIColor.colorFromRGB(85, g: 0, b: 255),
            UIColor.colorFromRGB(170, g: 0, b: 170),
            UIColor.colorFromRGB(85, g: 170, b: 85),
            UIColor.colorFromRGB(0, g: 85, b: 0),
            UIColor.colorFromRGB(255, g: 170, b: 0),
            UIColor.colorFromRGB(255, g: 255, b: 0),
            UIColor.colorFromRGB(255, g: 85, b: 0),
            UIColor.colorFromRGB(0, g: 85, b: 85),
            UIColor.colorFromRGB(0, g: 85, b: 255),
            UIColor.colorFromRGB(170, g: 170, b: 255),
            UIColor.colorFromRGB(85, g: 0, b: 0),
            UIColor.colorFromRGB(170, g: 85, b: 85),
            UIColor.colorFromRGB(170, g: 255, b: 0),
            UIColor.colorFromRGB(85, g: 170, b: 255),
            UIColor.colorFromRGB(0, g: 170, b: 170)
        ]
        return palette
    }

    /* ColorPalette is enum act as a palette that contain multiple colors to choose color from. */
    enum ColorPalette {
        case Green
        case Blue

        var colorValue: UIColor {
            switch self {
            case .Green:
                return UIColor.colorFromRGB(85, g: 0, b: 255)
            case .Blue:
                return UIColor.colorFromRGB(170, g: 0, b: 170)
            }

        }
    }
    
}
