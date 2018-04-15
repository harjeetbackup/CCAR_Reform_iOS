//
//  footerView.swift
//  ReformLuach
//
//  Created by Admin on 3/8/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit

protocol FooterViewDelegate:NSObjectProtocol {
    func loadMoreEvents(year:Int)
}

class FooterView: UITableViewHeaderFooterView {
    var loadMoreDelegate: FooterViewDelegate?
    static func footerView() -> FooterView {
        let view = Bundle.main.loadNibNamed("FooterView", owner: self, options: nil)![0] as! FooterView
        return view
    }

    @IBAction func loadMoreTapped(_ sender: UIButton) {
        //loadMoreDelegate?.loadMoreEvents(year: EventManager.shared.yearLoaded + 1)
    }
}
