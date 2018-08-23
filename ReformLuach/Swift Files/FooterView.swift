//
//  footerView.swift
//  ReformLuach
//
//  Created by Admin on 3/8/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {
    static func footerView() -> FooterView {
        let view = Bundle.main.loadNibNamed("FooterView", owner: self, options: nil)![0] as! FooterView
        return view
    }
}
