//
//  MainViewController.swift
//  TestTaskProject
//
//  Created by Antony Kolesynskyi on 1/26/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

typealias JSONDict = [String: Any]



var selectedIndexPath = Int()
var users = [User]()

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    func getPeopleFromServer() {
        print("GET")
        NetworkingClient.shared.getPeople { response in
            print(response)
            users = response.users
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = "App title"
        getPeopleFromServer()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainViewCell
        let imageURL = users[indexPath.row].mediumPicture
        if let imageData = NSData(contentsOf: imageURL) {
            cell.userImage.image = UIImage(data: imageData as Data)
        }
        cell.userImage.layer.cornerRadius = 45
        cell.userImage.clipsToBounds = true
        
        cell.userFirstName.text = users[indexPath.row].first
        cell.userSecondName.text = users[indexPath.row].last
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row

    }
    
}

    extension Dictionary where Key == String {
        func string(_ key: String) -> String? {
            if let value = self[key] as? String {
                return value
            } else {
                print("Missing parameter '\(key)'")
                return nil
            }
        }
        
        func array(_ key: String) -> [JSONDict] {
            if let value = self[key] as? [JSONDict] {
                return value
            } else {
                print("Missing parameter '\(key)'")
                return []
            }
        }
        
        func dict(_ key: String) -> JSONDict? {
            if let value = self[key] as? JSONDict{
                return value
            } else {
                print("Missing parameter '\(key)'")
                return nil
            }
        }
    }




