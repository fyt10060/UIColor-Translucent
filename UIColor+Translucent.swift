//
//  UIColor+Transluant.swift
//  HostApp
//
//  Created by fyt on 16/8/10.
//  Copyright © 2016年 fyt. All rights reserved.
//

import Foundation


extension UIColor {
    
    /** Return nil if the color can not be transform to RGB */
    func getRGB() -> (CGFloat, CGFloat, CGFloat)? {
        let cgColorRef = self.CGColor
        let numComponents = CGColorGetNumberOfComponents(cgColorRef)
        if numComponents == 4 {
            let components = CGColorGetComponents(cgColorRef)
            return (components[0] * 255, components[1] * 255, components[2] * 255)
        }else {
            return nil
        }
    }
    
    /** Return nil if the color can not be transform to RGB*/
    func getTranslucentColor() -> UIColor? {
        let cgColorRef = self.CGColor
        let numComponents = CGColorGetNumberOfComponents(cgColorRef)
        if numComponents == 4 {
            let components = CGColorGetComponents(cgColorRef)
            let color = UIColor.getTranslucentColor(RGB: (components[0] * 255, components[1] * 255, components[2] * 255))
            return color
        }else {
            return nil
        }
    }
    
    /** All the three values should over 40 */
    /** If you know what the UIColor values are, this will be what they will look like on screen when run*/
    class func getTranslucentColor(RGB rgb: (CGFloat, CGFloat, CGFloat)) -> UIColor {
        let newR = self.getTranslucentToDesign(value: rgb.0)
        let newG = self.getTranslucentToDesign(value: rgb.1)
        let newB = self.getTranslucentToDesign(value: rgb.2)
        
        return UIColor(red: newR, green: newG, blue: newB, alpha: 1)
    }
    
    
    private class func getTranslucentToDesign(value v: CGFloat) -> CGFloat {
        return ((1 - 40 / 255) * v + 40) / 255
    }
    
    private class func deTranslucentFromColor(value v: CGFloat) -> CGFloat {
        return ((v - 40) / (1 - 40 / 255)) / 255
    }
}

