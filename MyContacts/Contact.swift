//
//  Contact.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/29/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

struct Contact: JSONParsable
{
    let name: String
    let position: String
    var age: Int = 0
    let homePage: String
    let imageURL: String
    var emails = [Email]()
    var addresses = [Address]()
    var phoneNumbers = [PhoneNumber]()
    var companyDetails: CompanyDetails?
    
    
    init(json: NSDictionary) throws
    {
        guard let name = json["name"] as? String else
        {
            throw JSONParseError.MissingAttribute("name")
        }
        
        guard let position = json["position"] as? String else
        {
            throw JSONParseError.MissingAttribute("position")
        }
        
        guard let age = json["age"] as? Int else
        {
            throw JSONParseError.MissingAttribute("age")
        }
        
        guard let homePage = json["homePage"] as? String else
        {
            throw JSONParseError.MissingAttribute("homePage")
        }
        
        guard let imageURL = json["imageUrl"] as? String else
        {
            throw JSONParseError.MissingAttribute("imageURL")
        }
        
        self.name = name
        self.position = position
        self.age = age
        self.homePage = homePage
        self.imageURL = imageURL
        
        if let emailArray = json["emails"] as? NSArray
        {
            for emailDict in emailArray
            {
                do
                {
                    let newEmail = try Email(json: emailDict as! NSDictionary)
                    self.emails.append(newEmail)
                }
                catch JSONParseError.MissingAttribute(let missingAttribute)
                {
                    print("unable to load email, missing attribute: \(missingAttribute)")
                }
                catch
                {
                    fatalError("Something's gone terribly wrong: \(error)")
                }
            }
        }
        
        if let addressArray = json["address"] as? NSArray
        {
            for addressDict in addressArray
            {
                do
                {
                    let newAddress = try Address(json: addressDict as! NSDictionary)
                    self.addresses.append(newAddress)
                }
                catch JSONParseError.MissingAttribute(let missingAttribute)
                {
                    print("unable to load address, missing attribute: \(missingAttribute)")
                }
                catch
                {
                    fatalError("Something's gone terribly wrong: \(error)")
                }
            }
        }
        
        if let phoneArray = json["phone"] as? NSArray
        {
            for phoneDict in phoneArray
            {
                do
                {
                    let newPhone = try PhoneNumber(json: phoneDict as! NSDictionary)
                    self.phoneNumbers.append(newPhone)
                }
                catch JSONParseError.MissingAttribute(let missingAttribute)
                {
                    print("unable to load phone, missing attribute: \(missingAttribute)")
                }
                catch
                {
                    fatalError("Something's gone terribly wrong: \(error)")
                }
            }
        }
        
        if let detailDict = json["companyDetails"] as? NSDictionary
        {
            do
            {
                self.companyDetails = try CompanyDetails(json: detailDict)
            }
            catch JSONParseError.MissingAttribute(let missingAttribute)
            {
                print("unable to load company details, missing attribute: \(missingAttribute)")
            }
            catch
            {
                fatalError("Something's gone terribly wrong: \(error)")
            }
        }
    }
}