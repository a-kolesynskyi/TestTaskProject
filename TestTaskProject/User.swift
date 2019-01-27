//
//  User.swift
//  TestTaskProject
//
//  Created by Antony Kolesynskyi on 1/26/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import Foundation

struct User {
    let first: String
    let last: String
    let mediumPicture: URL
    let gender: String
    let phone: String
    let dateOfBirth: String


    init?(json: [String: Any]) {
        guard let name = json.dict("name") else { return nil }
        guard let first = name.string("first") else { return nil }
        guard let last = name.string("last") else { return nil }
        guard let mediumPicture = json.dict("picture")?.string("medium") else { return nil }
        guard let mediumURL = URL(string: mediumPicture) else { return nil }
        guard let gender = json.string("gender") else { return nil }
        guard let phone = json.string("phone") else { return nil }
        guard let dob = json.dict("dob") else { return nil }
        guard let dateOfBirth = dob.string("date") else { return nil }

        self.first = first
        self.last = last
        self.mediumPicture = mediumURL
        self.gender = gender
        self.phone = phone
        self.dateOfBirth = dateOfBirth

    }

    static func getArray(from jsonArray: Any) -> [User]? {
        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        return jsonArray.compactMap { User(json: $0) }
        
    }
}










