//
//  UIImageView+Download.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

extension UIImageView
{
    func loadFromURL(url: NSURL)
    {
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(queue,
        {
            let imageData = NSData(contentsOfURL: url)
                
            if imageData != nil
            {
                dispatch_async(dispatch_get_main_queue(),
                { () -> Void in
                    let newImage = UIImage(data: imageData!)
                    self.image = newImage
                })
            }
        })
    }
}
