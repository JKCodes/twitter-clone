//
//  Service.swift
//  TwitterClone
//
//  Created by Joseph Kim on 3/9/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomefeed(completion: @escaping (HomeDatasource) -> ()) {
        print("Fetching feed")
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfully fetched json objects")
            
            completion(homeDatasource)

        }) { (err) in
            print("Failed to fetch json...", err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
