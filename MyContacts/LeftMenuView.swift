//
//  LeftMenuView.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 2/3/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

class LeftMenuView: UIView
{
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawLayer(layer: CALayer, inContext ctx: CGContext)
    {
        
        layer.shadowOpacity = 0.8
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 1, height: 0)
        
        super.drawLayer(layer, inContext: ctx)
    }

}
