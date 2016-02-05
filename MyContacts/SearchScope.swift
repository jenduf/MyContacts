//
//  SearchScope.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 2/4/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

public enum SearchScope: Int
{
    case Name = 0, Company, Email
    
    public static let stringValues = ["Name", "Company", "Email"]
    
    func getString() -> String
    {
        return SearchScope.stringValues[self.rawValue]
    }
    
}
