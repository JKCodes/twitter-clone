//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Joseph Kim on 3/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        
        var users = [User]()
        if let array = json["users"].array {
            for userJson in array {
                let name = userJson["name"].stringValue
                let username = userJson["username"].stringValue
                let bio = userJson["bio"].stringValue
                
                let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
                users.append(user)
            }
        }
        
        self.users = users
    }
    
    let tweets: [Tweet] = {
        let user1 = User(name: "Example User", username: "@thecooluser", bioText: "This is my bio.  It's nice and short, and it is not very descriptive.  This is just an example bio", profileImage: #imageLiteral(resourceName: "profile_image"))
        let tweet1 = Tweet(user: user1, message: "Hey, take a look at this message.  It is going to be a really long message.")
        let tweet2 = Tweet(user: user1, message: "This is the second message for this project.  This is really just a temporary message.  This will be a long message as well.  This is a lot of fun!")
        return [tweet1, tweet2]
    }()
        
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
        return users[indexPath.row]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
