//
//  Contact.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/29/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

public class Contact
{
    public var name: String = ""
    public var position: String = ""
    public var age: Int = 0
    public var emails = [Email]()
    public var addresses = [Address]()
    public var phoneNumbers = [PhoneNumber]()
    public var companyDetails: CompanyDetails?
    public var homePage: String = ""
    public var imageURL: String = ""
    
    public init(dict: NSDictionary)
    {
        self.name = dict["name"] as! String
        self.position = dict["position"] as! String
        self.age = dict["age"] as! Int

        if let emailArray = dict["emails"] as? NSArray
        {
            for emailDict in emailArray
            {
                let newEmail = Email(dict: emailDict as! NSDictionary) as Email
                self.emails.append(newEmail)
            }
        }
        
        if let addressArray = dict["address"] as? NSArray
        {
            for addressDict in addressArray
            {
                let newAddress = Address(dict: addressDict as! NSDictionary) as Address
                self.addresses.append(newAddress)
            }
        }
        
        if let phoneArray = dict["phone"] as? NSArray
        {
            for phoneDict in phoneArray
            {
                let newPhone = PhoneNumber(dict: phoneDict as! NSDictionary) as PhoneNumber
                self.phoneNumbers.append(newPhone)
            }
        }
        
        if let details = dict["companyDetails"] as? NSDictionary
        {
            self.companyDetails = CompanyDetails(dict: details)
        }
        
        self.homePage = dict["homePage"] as! String
        
        self.imageURL = dict["imageUrl"] as! String
    }
}