//
//  BaseButton.swift
//  BaseFramework
//
//  Created by BRI on 13/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit

public class BaseButton: UIButton {

    open var cornerRadius: CGFloat = 12
    open var backgroundColors: UIColor = UIColor(red: 94/256, green: 115/256, blue: 143/256, alpha: 1.0)

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    

     override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColors
    }
    
   

}
