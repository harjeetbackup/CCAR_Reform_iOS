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
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let showDate = inputFormatter.date(from: (event?.date)!)
        inputFormatter.dateFormat = "MM/dd/yyyy"
        let resultString = inputFormatter.string(from: showDate!)
        lblEvntDate.text =  resultString
        lblEvntTitle.text = event?.title?.spellChangedForTitle()
    }
}
