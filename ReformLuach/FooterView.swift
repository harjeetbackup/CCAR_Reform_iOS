//
//  footerView.swift
//  ReformLuach
//
//  Created by Admin on 3/8/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit

protocol LoadDelegate:NSObjectProtocol {
    func increaseEvents(year:Int)
}
var yearCountForAllEvents = 2017
var yearCountForParshat = 2017
var yearCountForHolidays = 2017

class FooterView: UIView {
    var loadDelegate: LoadDelegate?
    static func footerView() -> FooterView {
        let view = Bundle.main.loadNibNamed("FooterView", owner: self, options: nil)![0] as! FooterView
        return view
        
    }
    

    @IBAction func loadMoreTapped(_ sender: UIButton) {
    
        if let type = eventType {
            switch type {
            case .all:
                yearCountForAllEvents = yearCountForAllEvents + 1
                loadDelegate?.increaseEvents(year: yearCountForAllEvents)
                break
            case .parshat:
                yearCountForParshat = yearCountForParshat + 1
                loadDelegate?.increaseEvents(year: yearCountForParshat)
                break
            case .holiday:
                yearCountForHolidays = yearCountForHolidays + 1
                loadDelegate?.increaseEvents(year: yearCountForHolidays)
                break
            default:
                break
            }
        }
        
    }
    
}
