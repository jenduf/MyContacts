//
//  ContactsViewController.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/30/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import UIKit

class ContactsViewController: BaseViewController
{
    @IBOutlet var contactsTableView: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var contacts = [Contact]()
    var filteredContacts = [Contact]()
    
    var currentScope: SearchScope = .Name
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.searchBar.showsScopeBar = true
        
        self.searchBar.scopeButtonTitles = SearchScope.stringValues
        
        self.loadData()
    }
    
    func loadData()
    {
        APIManager.sharedManager.getAPIRequest
        { (data, error) -> Void in
            for dict in data as! NSArray
            {
                let contact = Contact(dict: dict as! NSDictionary)
                self.contacts.append(contact)
            }
            
            self.contactsTableView.reloadData()
        }
    }
    
    func filterContacts(searchText: String)
    {
        self.filteredContacts.removeAll()
        
        let filtered = self.contacts.filter
        {
            var result: Bool = false
            
            switch self.currentScope
            {
                case .Name:
                    result = $0.name.localizedCaseInsensitiveContainsString(searchText)
                
                case .Company:
                    result = $0.companyDetails!.name.localizedCaseInsensitiveContainsString(searchText)
                
                case .Email:
                    result = $0.emails[0].address.localizedCaseInsensitiveContainsString(searchText)
            }
            
            return result
        }
        
        self.filteredContacts.appendContentsOf(filtered)
        
        self.contactsTableView.reloadData()
    }
    
    @IBAction func dismissKeyboard(recognizer: UITapGestureRecognizer)
    {
        self.searchBar.resignFirstResponder()
    }
}

extension ContactsViewController: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if !self.searchBar.text!.isEmpty
        {
            return self.filteredContacts.count
        }
        
        return self.contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.CONTACT_CELL_IDENTIFIER, forIndexPath: indexPath) as! ContactCell
        
        var contact: Contact
        
        if !self.searchBar.text!.isEmpty
        {
            contact = self.filteredContacts[indexPath.row] as Contact
        }
        else
        {
            contact = self.contacts[indexPath.row] as Contact
        }
        
        cell.contact = contact
        
        return cell
    }
}

extension ContactsViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var contact: Contact
        
        if self.filteredContacts.count > 0
        {
            contact = self.filteredContacts[indexPath.row] as Contact
        }
        else
        {
            contact = self.contacts[indexPath.row] as Contact
        }
        
        let detailViewController = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.CONTACT_DETAIL_VIEW_CONTROLLER) as! ContactDetailViewController
        detailViewController.contact = contact
        self.navController?.navigateToController(detailViewController)
    }
}

extension ContactsViewController: UISearchBarDelegate
{
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.filterContacts(searchText)
    }
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
    {
        let searchScope = SearchScope(rawValue: selectedScope)
        
        self.currentScope = searchScope!
        
        self.filterContacts(searchBar.text!)
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar)
    {
        self.tapGesture.enabled = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar)
    {
        self.tapGesture.enabled = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
}
