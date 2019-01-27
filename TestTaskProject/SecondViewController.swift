//
//  SecondViewController.swift
//  TestTaskProject
//
//  Created by Antony Kolesynskyi on 1/26/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstUserName: UILabel!
    @IBOutlet weak var lastUserName: UILabel!
    @IBOutlet weak var userGender: UILabel!
    @IBOutlet weak var userDateOfBirth: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Screen title"
        
        let jsonDate = users[selectedIndexPath].dateOfBirth
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "YYYY-mm-dd"
        
        if let date = dateFormatterGet.date(from: jsonDate) {
            userDateOfBirth.text = dateFormatterPrint.string(from: date)
        } else {
            print("Error")
        }
        
        firstUserName.text = users[selectedIndexPath].first
        lastUserName.text = users[selectedIndexPath].last
        userGender.text = users[selectedIndexPath].gender
        userPhoneNumber.text = users[selectedIndexPath].phone
        
        let imageURL = users[selectedIndexPath].mediumPicture
        if let ImageData = NSData(contentsOf: imageURL) {
            userImage.image = UIImage(data: ImageData as Data)
        }
        userImage.layer.cornerRadius = 75.0
        userImage.clipsToBounds = true
        
    }
    
}
