//
//  cardView.swift
//  JobPortal
//
//  Created by Varun on 05/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

@IBDesignable
class cardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 6
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var shadowSize : Float = 0
    @IBInspectable var borderColor : UIColor? = UIColor.clear
    @IBInspectable var borderWidth : Float = 0
    
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }

}
