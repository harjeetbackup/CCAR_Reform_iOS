//
//  EventManager+SubtitleLogic.swift
//  ReformLuach
//
//  Created by Niranjan on 5/24/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

extension EventManager {
    
    func applySubTitleLogic(_ events:[RLEvent]){
        
        var specialEvent : RLEvent?
        var isComparable : Bool?
        var comparableEvent : RLEvent?
        for event in events {
            if event.isSpecialDayForSubTitle() {
                specialEvent = event
            }
            if event.isComparableDayForSubTitle().0{
                comparableEvent = event.isComparableDayForSubTitle().1
                isComparable = true
            }
            if specialEvent != nil && isComparable == true {
                if Calendar.current.isDate(specialEvent!.eventDate(), inSameDayAs: (comparableEvent?.eventDate())!) {
                        if let specialEventTitle = comparableEvent?.title {
                            specialEvent?.subTitle = "The Haftarah \(specialEventTitle.spellChangedForTitle()) should be read."
                            specialEvent = nil

                        }
                    }
                }
               // specialEvent = nil
            }
        }
}

