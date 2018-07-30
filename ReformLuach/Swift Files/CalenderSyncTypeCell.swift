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
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var subTitleLabel: UILabel!
    var syncType: SyncType? {
        didSet {
            self.backgroundColor = UIColor.white
            self.isUserInteractionEnabled = true
            self.activityIndicatorView.isHidden = true
            titleLabel.text = syncType?.title
            subTitleLabel.text = syncType?.subTitle
            subTitleLabel.textColor = UIColor.black
            titleLabel.textColor = UIColor.black
            
            if syncType?.syncState == .completed {
                selectionImageView.image = #imageLiteral(resourceName: "Calender_select")
                selectionImageView.alpha = 0.5
                titleLabel.textColor = UIColor.gray
            } else if syncType?.syncState == .selected {
                selectionImageView.image = #imageLiteral(resourceName: "Calender_select")
                selectionImageView.alpha = 1
            } else if syncType?.syncState == .inProgress {
                self.activityIndicatorView.isHidden = false
                self.activityIndicatorView.startAnimating()
                self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                self.isUserInteractionEnabled = false
            } else {
                selectionImageView.image = #imageLiteral(resourceName: "Calender_Unselect")
                selectionImageView.alpha = 1
            }
        }
    }
}
