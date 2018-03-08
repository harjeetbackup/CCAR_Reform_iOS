//
//  Date.swift
//  ReformLuach
//
//  Created by Admin on 3/8/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

extension Date {
    
    func getCurrentYear() {
        let currentYear = Calendar.current.date(byAdding: .year, value: 0, to: Date())!
    }
    
}

