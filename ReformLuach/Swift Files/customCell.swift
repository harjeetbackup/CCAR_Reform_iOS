//
//  customCell.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/7/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit

let inputFormatter = DateFormatter()

class customCell: UITableViewCell
{

    @IBOutlet weak var lblEvntTitle: UILabel!
    @IBOutlet weak var lblEvntDate: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel?
    var event: RLEvent? = nil {
        didSet {
            configure()
        }
    }
    
    func configure() {
        if let eventDate = event?.date {
            inputFormatter.dateFormat = "yyyy-MM-dd"
            let showDate = inputFormatter.date(from: eventDate)
            inputFormatter.dateFormat = "MM/dd/yyyy"
            let resultString = inputFormatter.string(from: showDate!)
            lblEvntDate.text =  resultString
            subTitleLabel?.text = event?.subTitle
            if event?.subTitle != nil {
               self.backgroundColor = UIColor.yellow.withAlphaComponent(0.33)
            } else {
                self.backgroundColor = UIColor.white
            }
        }
        lblEvntTitle.text = event?.title?.spellChangedForTitle()
    }
}
