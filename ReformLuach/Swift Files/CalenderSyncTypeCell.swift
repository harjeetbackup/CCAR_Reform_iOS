//
//  CalenderSyncTypeCell.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 14/07/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit

class CalenderSyncTypeCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionImageView: UIImageView!
    var syncType: SyncType? {
        didSet {
            titleLabel.text = syncType?.title
            if syncType?.syncState == .completed {
                selectionImageView.image = #imageLiteral(resourceName: "Calender_select")
                selectionImageView.alpha = 0.5
            } else if syncType?.syncState == .progress {
                selectionImageView.image = #imageLiteral(resourceName: "Calender_select")
                selectionImageView.alpha = 1
            } else {
                selectionImageView.image = #imageLiteral(resourceName: "Calender_Unselect")
                selectionImageView.alpha = 1
            }
        }
    }
}
