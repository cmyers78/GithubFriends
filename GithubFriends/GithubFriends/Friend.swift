//
//  Friend.swift
//  GithubFriends
//
//  Created by Christopher Myers on 6/21/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class Friend: NSObject {
    
    var username : String = ""
    var githubID : Int = 0
    var avatarImage : String = ""
    var userEmail : String = ""
    var publicRepository : Int = 0
    var publicGists : Int = 0
    var followers : Int = 0
    var following : Int = 0
    var dateJoined : String = ""
    
    
    override init() {
        super.init()
        
        self.username = ""
        self.githubID = 0
        self.avatarImage = ""
        self.userEmail = ""
        self.publicRepository = 0
        self.publicGists = 0
        self.followers = 0
        self.following = 0
        self.dateJoined = ""
    }
    
    init(dict : JSONDictionary) {
        super.init()
        
        if let name = dict["name"] as? String {
            self.username = name
            
        } else {
            print("I could not parse the login name")
        }
        
        if let githubID = dict["id"] as? Int {
            self.githubID = githubID
        } else {
            print("I could not parse the github ID")
        }
        
        if let avatarURL = dict["avatar_url"] as? String {
            self.avatarImage = avatarURL
        } else {
            print("I could not parse the avatar url")
        }
        
        if let email = dict["email"] as? String {
            self.userEmail = email
        } else {
            print("I could not parse the user email")
        }
        
        if let pubRep = dict["public_repos"] as? Int {
            self.publicRepository = pubRep
        } else {
            print("I could not parse the repository")
        }
        if let pubGist = dict["public_gists"] as? Int {
            self.publicGists = pubGist
        } else {
            print("I could not parse the gists")
        }
        if let followers = dict["followers"] as? Int {
            self.followers = followers
        } else {
            print("I could not parse the followers")
        }
        if let following = dict["following"] as? Int {
            self.following = following
        } else {
            print("I could not parse following")
        }
        if let dateJoin = dict["created_at"] as? String {
            self.dateJoined = dateJoin
        } else{
            print("I could not parse date joined")
        }
        
    }

}
