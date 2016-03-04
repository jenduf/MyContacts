//
//  ParseError.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 2/10/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

protocol JSONParsable
{
    init(json: NSDictionary) throws
}

enum JSONParseError: ErrorType
{
    case MissingAttribute(String)
}