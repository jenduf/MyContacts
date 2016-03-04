//
//  PhoneNumber.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

struct PhoneNumber: JSONParsable
{
    let number: String
    let type: String

    init(json: NSDictionary) throws
    {
        guard let number = json["number"] as? String else
        {
            throw JSONParseError.MissingAttribute("number")
        }
        
        guard let type = json["type"] as? String else
        {
            throw JSONParseError.MissingAttribute("type")
        }
        
        self.number = number
        self.type = type
    }
}