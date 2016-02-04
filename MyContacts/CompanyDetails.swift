//
//  CompanyDetails.Swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

public class CompanyDetails
{
    public var location: String = ""
    public var name: String = ""
    
    public init(dict: NSDictionary)
    {
        self.location = dict["location"] as! String
        self.name = dict["name"] as! String
    }
}