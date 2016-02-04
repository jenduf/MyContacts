//
//  PhoneNumber.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation


public class PhoneNumber
{
    public var number: String = ""
    public var type: String = ""
    
    public init(dict: NSDictionary)
    {
        self.number = dict["number"] as! String
        self.type = dict["type"] as! String
    }
}