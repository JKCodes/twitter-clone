//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Joseph Kim on 3/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let user1 = User(name: "Example User", username: "@thecooluser", bioText: "This is my bio.  It's nice and short, and it is not very descriptive.  This is just an example bio", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let user2 = User(name: "User Example", username: "@foobar123", bioText: "This is example user 2's bio.  I like to eat a lot of food, and I like to exercise to burn off those calories.", profileImage: #imageLiteral(resourceName: "profile_image2"))
        return [user1, user2]
    }()
        
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.row]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
