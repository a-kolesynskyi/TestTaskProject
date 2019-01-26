//
//  MainViewController.swift
//  TestTaskProject
//
//  Created by Antony Kolesynskyi on 1/26/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import Foundation
import UIKit


var selectedIndexPath = Int()

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let array = ["[1],[2],[3],[4],[5],[6],[5],[4],[3]"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainViewCell
        cell.userFirstName.text = array[indexPath.row]
        cell.userSecondName.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

typealias JSONDict = [String: Any]

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


