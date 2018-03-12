//
//  footerView.swift
//  ReformLuach
//
//  Created by Admin on 3/8/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit

protocol LoadDelegate:NSObjectProtocol {
    func fetchEvents(year:Int)
}

let date = Date()
let calendar = Calendar.current
let year = calendar.component(.year, from: date)
var yearCount = year

class FooterView: UIView {
    var loadDelegate: LoadDelegate?
    static func footerView() -> FooterView {
        let view = Bundle.main.loadNibNamed("FooterView", owner: self, options: nil)![0] as! FooterView
        return view
    }
    

    @IBAction func loadMoreTapped(_ sender: UIButton) {
        yearCount = yearCount + 1
        loadDelegate?.fetchEvents(year: yearCount)
    }
}
