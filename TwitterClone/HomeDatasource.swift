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

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{try T(json: $0)}
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        
        guard let usersJsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid."])
        }

        self.users = try usersJsonArray.decode()
        self.tweets = try tweetsJsonArray.decode()
    }
        
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
