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
        
        let user3 = User(name: "Another User", username: "@abcd1234", bioText: "This is my bio. I like to go hiking, swimming, and running.  I have visited over 200 countries, and I have lived in five different continents.  I would like to visit every country in the world, and I would like to live in Antarctica one day.  That would be so so sweet!", profileImage: #imageLiteral(resourceName: "profile_image"))
        return [user1, user2, user3]
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
