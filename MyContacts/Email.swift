
//
//  Email.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

public class Email
{
    public var address: String = ""
    public var label: String = ""
    
    public init(dict: NSDictionary)
    {
        self.address = dict["email"] as! String
        self.label = dict["label"] as! String
    }
}