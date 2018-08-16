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
            if let cat = event?.category {
                if cat == "parashat" {
                    //- [ ] gold/orange - 253 , 220, 174
                    self.backgroundColor = UIColor.init(red: 253/255, green: 220/255, blue: 174/255, alpha: 1.0)
                } else {
                    //- [ ] Blue - 190, 238, 253
                    self.backgroundColor = UIColor.init(red: 190/255, green: 238/255, blue: 253/255, alpha: 1.0)
                }
            }
        }
        lblEvntTitle.text = event?.title?.spellChangedForTitle()
    }
}
