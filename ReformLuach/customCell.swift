//
//  customCell.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/7/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit

class customCell: UITableViewCell
{

    @IBOutlet weak var lblEvntTitle: UILabel!
    @IBOutlet weak var lblEvntDate: UILabel!
    var event: RLEvent? = nil {
        didSet {
            configure()
        }
    }
    
    func configure() {
        lblEvntDate.text =  event?.date
        lblEvntTitle.text = event?.title
    }
}
