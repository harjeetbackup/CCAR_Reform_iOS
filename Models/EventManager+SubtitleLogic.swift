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
        var comparableEvent : RLEvent?
        for event in events {
            
            if event.isSpecialDayForSubTitle() {
                specialEvent = event
            }
            if event.isComparableDayForSubTitle(){
                comparableEvent = event
            }
            
            if specialEvent != nil && comparableEvent != nil {
                if Calendar.current.isDate(specialEvent!.eventDate(), inSameDayAs: (comparableEvent?.eventDate())!) {
                        if let title = specialEvent?.title?.spellChangedForTitle() {
                            comparableEvent?.subTitle = "The Haftarah \(title) should be read."
                            specialEvent?.subTitle = ""
                            specialEvent = nil
                            comparableEvent = nil
                        }
                    }
                }
               // specialEvent = nil
            }
        }
}

