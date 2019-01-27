//
//  NetworkingClient.swift
//  TestTaskProject
//
//  Created by Antony Kolesynskyi on 1/26/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class NetworkingClient {
    
    static let shared = NetworkingClient()
    private init() {}
    
    func getPeople(success successBlock: @escaping (GetPeopleResponse) -> Void) {
        Alamofire.request("https://randomuser.me/api?results=20").responseJSON { response in
            guard let json = response.result.value as? JSON else { return }
            do {
                let getPeopleResponse = try GetPeopleResponse(json: json)
                successBlock(getPeopleResponse)
            } catch {
                
            }
        }
    }
}
