//
//  ViewController.swift
//  GithubFriends
//
//  Created by Christopher Myers on 6/21/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

protocol GithubAPIDelegate : class  {
    func passDictionary(dict : JSONDictionary)
}

class ViewController: UIViewController, GithubAPIDelegate {


    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var followersLabel: UILabel!

    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var dateJoinedLabel: UILabel!
    
    let controller = APIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controller.delegate = self
        
        self.controller.fetchGithubUser("cmyers78")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func passDictionary(dict: JSONDictionary) {
        
        let githubFriend = Friend(dict: dict)
        
        self.userNameLabel.text = githubFriend.username
        
        //print(githubFriend.username)
        
        self.emailLabel.text = githubFriend.userEmail
        
        self.followersLabel.text = String(githubFriend.followers)
        self.followingLabel.text = String(githubFriend.following)
        
        self.getImageFromURLString(githubFriend.avatarImage)
        
    }
    
    
    func getImageFromURLString(urlString : String) {
        // Convert from string to NSURL
        
        if let url = NSURL(string: urlString) {
            
            let session = NSURLSession.sharedSession()
            
            let task = session.dataTaskWithURL(url, completionHandler: {(data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let data = data {
                    let image = UIImage(data: data)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.imageView.image = image
                        
                        // forces any view to redraw itself
                        self.imageView.setNeedsLayout()
                        
                    })
                }
                
            })
            task.resume()
            
            
        } else {
            print("Not a valid url")
        }
    }

    
}

