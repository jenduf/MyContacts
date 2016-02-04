//
//  NavScreen.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 2/3/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

public enum NavScreen: Int
{
    case Login = 0, Contacts, Detail
    
    public var titleText: String
    {
        switch self
        {
            case .Login:
                return "Log in"
            
            case .Contacts:
                return "Contacts"
            
            case .Detail:
                return "Contact Detail"
        }
        
    }
    
    public var imageName: String
    {
        switch self
        {
            case .Login:
                return ""
                
            case .Contacts:
                return "nav_icon"
                
            case .Detail:
                return "back_arrow"
        }
    }
}