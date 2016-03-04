
//
//  Address.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

struct Address: JSONParsable
{
    let address1: String
    let address2: String
    let address3: String
    let city: String
    let country: String
    let state: String
    let zip: String
    
    init(json: NSDictionary) throws
    {
        guard let address1 = json["address1"] as? String else
        {
            throw JSONParseError.MissingAttribute("address1")
        }
        
        guard let address2 = json["address2"] as? String else
        {
            throw JSONParseError.MissingAttribute("address2")
        }
        
        guard let address3 = json["address3"] as? String else
        {
            throw JSONParseError.MissingAttribute("address3")
        }
        
        guard let city = json["city"] as? String else
        {
            throw JSONParseError.MissingAttribute("city")
        }
        
        guard let country = json["country"] as? String else
        {
            throw JSONParseError.MissingAttribute("country")
        }
        
        guard let state = json["state"] as? String else
        {
            throw JSONParseError.MissingAttribute("state")
        }
        
        guard let zip = json["zipcode"] as? NSNumber else
        {
            throw JSONParseError.MissingAttribute("zip")
        }
        
        self.address1 = address1
        self.address2 = address2
        self.address3 = address3
        self.city = city
        self.country = country
        self.state = state
        self.zip = String(zip)
    }
    
    func getLocationString() -> String
    {
        var locationString = ""
        
        if !self.city.isEmpty
        {
            locationString.appendContentsOf(self.city)
        }
        
        if locationString.isEmpty == false && self.state.isEmpty == false
        {
            locationString.appendContentsOf(", \(self.state)")
        }
        else if self.state.isEmpty == false
        {
            locationString.appendContentsOf(self.state)
        }
        
        if locationString.isEmpty == false && self.zip.isEmpty == false
        {
            locationString.appendContentsOf(" \(self.zip)")
        }
        else if self.zip.isEmpty == false
        {
            locationString.appendContentsOf(self.zip)
        }
        
        return locationString
    }
    
    func getMultilineAddress() -> String
    {
        var multiAddress = ""
        
        if !self.address1.isEmpty
        {
            multiAddress.appendContentsOf(self.address1)
        }
        
        if !self.address2.isEmpty
        {
            multiAddress.appendContentsOf("\n\(self.address2)")
        }
        
        if !self.address3.isEmpty
        {
            multiAddress.appendContentsOf("\n\(self.address3)")
        }
        
        return multiAddress
    }
}