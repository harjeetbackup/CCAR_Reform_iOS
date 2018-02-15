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

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
