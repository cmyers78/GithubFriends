//
//  APIController.swift
//  GithubFriends
//
//  Created by Christopher Myers on 6/21/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
    weak var delegate : GithubAPIDelegate?
    
    
    // create a session
    
    let session = NSURLSession.sharedSession()
    

    func fetchGithubUser(username : String) {
        let urlString = "https://api.github.com/users/\(username)"
        
        // 2. make an nsurl object
        if let url = NSURL(string: urlString) {
            
            // 3. create task
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data : NSData?, response : NSURLResponse?, error : NSError?) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let jsonDictionary = self.parseJSON(data) {
                    print(jsonDictionary)
                    
                    //let theFriend = Friend(dict: jsonDictionary)
                    
                    // self.delegate?.passFriend(??????)
                    
                    self.delegate?.passDictionary(jsonDictionary)
                    
                    
                    
                } else {
                    print ("I could not parse the jsonDictionary")
                }
                
            })
                task.resume()
            
        } else {
            print("Not a valid URL")
        }
        
        
        
    }

    
    
    func parseJSON(data : NSData?) -> JSONDictionary? {
        
        var theDictionary : JSONDictionary? = nil
        // 5. Parse the JSON
        
        if let data = data {
            do {
                if let jsonDictonary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                    
                    theDictionary = jsonDictonary
                    
                    
                } else {
                    print("Could not parse jsonDictionary")
                }
                
            } catch {
                
            }
        } else {
            print("Could not unwrap the data")
        }
        return theDictionary
        
    }

}
