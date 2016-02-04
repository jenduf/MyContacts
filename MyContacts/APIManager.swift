//
//  APIManager.swift
//  MyContacts
//
//  Created by Jennifer Duffey on 1/29/16.
//  Copyright © 2016 Jennifer Duffey. All rights reserved.
//

import Foundation

public class APIManager: NSObject, NSURLSessionDelegate, NSURLSessionDataDelegate
{
    class var sharedManager: APIManager
    {
        struct SharedInstance
        {
            static let instance = APIManager()
        }
        
        return SharedInstance.instance
    }
    
    private var currentTask: NSURLSessionTask!
    lazy var session: NSURLSession =
    {
        let queue = NSOperationQueue.mainQueue()
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        return NSURLSession(configuration: config, delegate: self, delegateQueue: queue)
    }()
    
    
    // MARK: Parse Helpers
    func parseJSONResponse(json: NSData?) -> AnyObject?
    {
        var jsonData = []
        
        do
        {
            let jsonObject = try NSJSONSerialization.JSONObjectWithData(json!, options: .AllowFragments)
            jsonData = jsonObject as! NSArray
            print("JSON Data: \(jsonData)")
        }
        catch
        {
            let nsError = error as NSError
            print("JSON ERROR: \(nsError), DATA: \(json)")
        }

        return jsonData
    }
    
    func dictionaryToJSON(dictionary: NSDictionary) throws -> NSData
    {
        do
        {
            let data = try NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.PrettyPrinted)
            return data
        }
        catch _ as NSError
        {
            throw NSError(domain: NSURLErrorDomain, code: -1, userInfo: nil)
        }
    }
    
    // MARK: API Request Builder
    func getAPIRequest(requestName: String = "", method: String = "GET", parameters: NSDictionary = [:], completion: (data: AnyObject?, error: NSError?) -> Void)
    {
        let url = NSURL(string: "\(Constants.API_URL)\(requestName)")
        
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //var returnedItems = [AnyObject]()
        
        self.currentTask = self.session.dataTaskWithRequest(request, completionHandler:
        { (data, response, error) -> Void in
            let jsonArray: NSArray = self.parseJSONResponse(data) as! NSArray
            completion(data: jsonArray, error: error)
        })
        
        self.currentTask.resume()
    }
    
    
}
