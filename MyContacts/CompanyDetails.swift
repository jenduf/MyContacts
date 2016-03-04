//
//  CompanyDetails.Swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

struct CompanyDetails: JSONParsable
{
    let location: String
    let name: String
    
    init(json: NSDictionary) throws
    {
        guard let location = json["location"] as? String else
        {
            throw JSONParseError.MissingAttribute("location")
        }
        
        guard let name = json["name"] as? String else
        {
            throw JSONParseError.MissingAttribute("name")
        }
        
        self.location = location
        self.name = name
    }
}