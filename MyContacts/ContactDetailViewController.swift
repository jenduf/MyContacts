//
//  ContactDetailViewController.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/31/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

class ContactDetailViewController: BaseViewController
{
    var contact: Contact?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var companyLocationLabel: UILabel!
    @IBOutlet var homepageLabel: UILabel!
    @IBOutlet var contactImageView: UIImageView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.nameLabel.text = "\(self.contact!.name), \(self.contact!.age)"
        self.positionLabel.text = self.contact!.position
        self.companyLabel.text = "\(self.contact!.companyDetails!.name),"
        self.companyLocationLabel.text = self.contact!.companyDetails?.location
        self.emailLabel.text = self.contact!.emails[0].address
        self.addressLabel.text = self.contact!.addresses[0].getMultilineAddress()
        self.locationLabel.text = self.contact!.addresses[0].getLocationString()
        self.phoneLabel.text = self.contact!.phoneNumbers[0].number
        self.homepageLabel.text = "\(self.contact!.homePage)"
        self.contactImageView.loadFromURL(NSURL(string: self.contact!.imageURL)!)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
