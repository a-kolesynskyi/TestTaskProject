//
//  MainViewCell.swift
//  TestTaskProject
//
//  Created by Antony Kolesynskyi on 1/26/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userFirstName: UILabel!
    @IBOutlet weak var userSecondName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
