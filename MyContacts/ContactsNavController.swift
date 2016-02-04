//
//  ContactsNavController.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 2/3/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

class ContactsNavController: UIViewController
{
    @IBOutlet var navBar: NavBarView!
    @IBOutlet var leftMenuView: LeftMenuView!
    @IBOutlet var containerView: UIView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func navButtonSelected(sender: AnyObject)
    {
        let navScreen = NavScreen(rawValue: self.topViewController().view.tag)
        
        if navScreen == .Contacts
        {
            self.toggleLeftNav()
        }
        else if navScreen == .Detail
        {
            self.popViewController()
        }
    }
    
    @IBAction func logout(sender: AnyObject)
    {
        self.toggleLeftNav()
        
        self.popViewController()
    }
    
    func toggleLeftNav()
    {
        if self.leftMenuView.leadingConstraint.constant < -20
        {
            self.leftMenuView.leadingConstraint?.constant = -20
            self.leftMenuView.setNeedsUpdateConstraints()
        }
        else
        {
            self.leftMenuView.leadingConstraint.constant = -(self.leftMenuView.frame.width + 20)
            self.leftMenuView.setNeedsUpdateConstraints()
        }
        
        UIView.animateWithDuration(0.3, animations:
        { () -> Void in
                
            self.leftMenuView.layoutIfNeeded()
        })
    }
    
    func updateForScreen(navScreen: NavScreen)
    {
        self.navBar.titleLabel.text = navScreen.titleText
        self.navBar.menuButton.setImage(UIImage(named: navScreen.imageName), forState: UIControlState.Normal)
    }
    
    func navigateToController(newController: BaseViewController)
    {
        let oldController = self.topViewController() as BaseViewController
        
        UIView.animateWithDuration(0.5, animations:
        { () -> Void in
                oldController.view.frame.origin = CGPoint(x: -oldController.view.frame.width, y: oldController.view.frame.origin.y)
        })
        { (Bool) -> Void in
                oldController.view.removeFromSuperview()
        }
        
        self.addChildViewController(newController)
        
        self.containerView.addSubview(newController.view)
        
        newController.view.frame.origin = CGPoint(x: self.view.frame.width, y: newController.view.frame.origin.y)
        
        UIView.animateWithDuration(0.5, animations:
        { () -> Void in
            newController.view.frame.origin = CGPoint(x: 0, y: newController.view.frame.origin.y)
        },
        completion:
        { (Bool) -> Void in
            
            newController.didMoveToParentViewController(self)
            
            let screen = NavScreen(rawValue: newController.view.tag)
            self.updateForScreen(screen!)
        })
    }
    
    func popViewController()
    {
        let oldController = self.topViewController()
        
        let newController = (self.childViewControllers[self.childViewControllers.count - 2]) as! BaseViewController
        
        UIView.animateWithDuration(0.5, animations:
        { () -> Void in
            oldController.view.frame.origin = CGPoint(x: self.view.frame.width, y: oldController.view.frame.origin.y)
        },
        completion:
        { (Bool) -> Void in
            oldController.willMoveToParentViewController(nil)
            oldController.removeFromParentViewController()
            oldController.view.removeFromSuperview()
        })
        
        self.containerView.addSubview(newController.view)
        
        newController.view.frame.origin = CGPoint(x: -oldController.view.frame.width, y: oldController.view.frame.origin.y)
        
        UIView.animateWithDuration(0.5, animations:
        { () -> Void in
                newController.view.frame.origin = CGPoint(x: 0, y: newController.view.frame.origin.y)
        },
        completion:
        { (Bool) -> Void in
                
            newController.didMoveToParentViewController(self)
                
            let screen = NavScreen(rawValue: newController.view.tag)
            self.updateForScreen(screen!)
        })
    }
    

    // MARK: Helpers
    func topViewController() -> BaseViewController
    {
        return self.childViewControllers.last as! BaseViewController
    }


}
