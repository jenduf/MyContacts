
//
//  Email.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

struct Email: JSONParsable
{
    let address: String
    let label: String
    
    init(json: NSDictionary) throws
    {
        guard let address =  json["email"] as? String else
        {
            throw JSONParseError.MissingAttribute("address")
        }
        
        guard let label = json["label"] as? String else
        {
            throw JSONParseError.MissingAttribute("label")
        }
        
        self.address = address
        self.label = label
    }
}