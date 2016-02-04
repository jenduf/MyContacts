//
//  ViewController.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/29/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController
{
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickSubmit(sender: AnyObject?)
    {
        if self.isValidData() == true
        {
            let contactsViewController = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.CONTACTS_VIEW_CONTROLLER) as! ContactsViewController
            self.navController?.navigateToController(contactsViewController)
        }
        else
        {
            let alertController = UIAlertController(title: "Error", message: "Please ensure that the e-mail address is valid and that you have entered a password", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

    func isValidData() -> Bool
    {
        if !self.emailTextField.text!.isEmpty
        {
            if let _ = self.emailTextField.text!.rangeOfString("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", options: .RegularExpressionSearch)
            {
                if !self.passwordTextField.text!.isEmpty
                {
                    return true
                }
            }
        }
        
        return false
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        self.clickSubmit(nil)
        
        return true
    }
}

