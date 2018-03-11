//
//  String+Additions.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 11/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

extension String {
    
    func html() -> String? {
        var name = self;
        name = name.spellChanged()
        name = name.removeSpecialChars()
        let url = Bundle.main.url(forResource: name, withExtension: "html");
        return url?.absoluteString
    }
    
    func spellChanged() -> String {
        var name = self;
        name = name.replacingOccurrences(of: "Chanukah: 8th Day", with: "Chanukah 8 Weekday")
        return name
    }
    
    func removeSpecialChars() -> String {
        var name = self;
        name = name.replacingOccurrences(of: ":", with: "")
        name = name.replacingOccurrences(of: "/", with: "-")
        name = name.replacingOccurrences(of: " ", with: "_")
        return name
    }
}
