//
//  GetPeopleResponse.swift
//  TestTaskProject
//
//  Created by Antony Kolesynskyi on 1/26/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import Foundation

struct GetPeopleResponse {
    
    let users: [User]
    // calling json data
    init(json: JSON) throws {
        guard let results = json["results"] as? [JSON] else { throw NetworkingError.badNetworkingStuff }
        let users = results.map{ User(json: $0) }.compactMap{ $0 }
        self.users = users
        
        
    }
}






















