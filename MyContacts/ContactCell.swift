//
//  ContactCell.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell
{

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var homepageLabel: UILabel!
    @IBOutlet var contactImageView: UIImageView!
    
    var contact: Contact?
    {
        didSet
        {
            self.configureCell()
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell()
    {
        if let contact = contact
        {
            self.nameLabel.text = "\(contact.name), \(contact.age)"
            self.positionLabel.text = "\(contact.position), "
            self.companyLabel.text = contact.companyDetails?.name
            self.emailLabel.text = contact.emails[0].address
            self.addressLabel.text = contact.addresses[0].address1
            self.locationLabel.text = contact.addresses[0].getLocationString()
            self.phoneLabel.text = contact.phoneNumbers[0].number
            self.homepageLabel.text = "\(contact.homePage)"
            self.contactImageView.loadFromURL(NSURL(string: contact.imageURL)!)
        }
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        self.contactImageView.image = nil
        
        self.nameLabel.text = ""
        self.positionLabel.text = ""
        self.companyLabel.text = ""
        self.emailLabel.text = ""
        self.addressLabel.text = ""
        self.locationLabel.text = ""
        self.phoneLabel.text = ""
        self.homepageLabel.text = ""
    }

}
