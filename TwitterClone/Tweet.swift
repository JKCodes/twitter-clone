//
//  Tweet.swift
//  TwitterClone
//
//  Created by Joseph Kim on 3/8/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
