
//
//  Address.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

public class Address
{
    public var address1: String = ""
    public var address2: String = ""
    public var address3: String = ""
    public var city: String = ""
    public var country: String = ""
    public var state: String = ""
    public var zip: String = ""
    
    public init(dict: NSDictionary)
    {
        self.address1 = dict["address1"] as! String
        self.address2 = dict["address2"] as! String
        self.address3 = dict["address3"] as! String
        self.city = dict["city"] as! String
        self.country = dict["country"] as! String
        self.state = dict["state"] as! String
        
        if let z = dict["zipcode"] as? NSNumber
        {
            self.zip = String(z)
        }
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