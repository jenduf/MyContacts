//
//  BaseViewController.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 2/3/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController
{
    var navController: ContactsNavController?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func didMoveToParentViewController(parent: UIViewController?)
    {
        super.didMoveToParentViewController(parent)
        
        self.navController = parent as? ContactsNavController
    }
    
    override func willMoveToParentViewController(parent: UIViewController?)
    {
        super.willMoveToParentViewController(parent)
        
        self.navController = parent as? ContactsNavController
    }

}
