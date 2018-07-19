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
        var threeSpecialEvent : RLEvent?
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
                        comparableEvent?.subTitle = "The Haftarah for \(title) should be read."
                        specialEvent?.subTitle = ""
                        specialEvent = nil
                        comparableEvent = nil
                    }
                }
            }
        }
        for event in events {
            
            if event.isSpecialDayForSubTitle() {
                specialEvent = event
            }
            if event.isComparableDayForSubTitle() {
                comparableEvent = event
            }
            if event.isThreeEventsOfSpecialDayForSubTitle() {
                threeSpecialEvent = event
            }
            if specialEvent != nil && comparableEvent != nil && threeSpecialEvent != nil {
                if Calendar.current.isDate(specialEvent!.eventDate(), inSameDayAs: (comparableEvent?.eventDate())!) && Calendar.current.isDate(threeSpecialEvent!.eventDate(), inSameDayAs: (comparableEvent?.eventDate())!) {
                    if let title = specialEvent?.title?.spellChangedForTitle() {
                        comparableEvent?.subTitle = "The Haftarah for \(title) should be read."
                        specialEvent?.subTitle = ""
                        threeSpecialEvent?.subTitle = "The Haftarah for \(title) should be read."
                        specialEvent = nil
                        comparableEvent = nil
                        threeSpecialEvent = nil
                    }
                }
            }
        }
        
        for event in events {
            if event.isSukkotAndChanukahSaturdayEventSpecialDayForSubTitle() {
                specialEvent = event
            }
            // TODO check chanukah 2nd candels or night
            if let sukkotAndChanukhaEvents = specialEvent {
                if sukkotAndChanukhaEvents.inSaturday() {
                    if let title = sukkotAndChanukhaEvents.title?.spellChangedForTitle() {
                        switch title {
                        case "Sukkot 2 Weekday":
                            addSubtitleForEvents(subtitleName: "Sukkot 2", event: sukkotAndChanukhaEvents)
                        case "Sukkot 3 Weekday":
                            addSubtitleForEvents(subtitleName: "Sukkot 3", event: sukkotAndChanukhaEvents)
                        case "Sukkot 4 Weekday":
                            addSubtitleForEvents(subtitleName: "Sukkot 4", event: sukkotAndChanukhaEvents)
                        case "Sukkot 5 Weekday":
                            addSubtitleForEvents(subtitleName: "Sukkot 5", event: sukkotAndChanukhaEvents)
                        case "Sukkot 6 Weekday":
                            addSubtitleForEvents(subtitleName: "Sukkot 6", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 2 Candles":
                            addSubtitleForEvents(subtitleName: "Chanukah: 2nd Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 3 Candles":
                            addSubtitleForEvents(subtitleName: "Chanukah: 3rd Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 4 Candles":
                            addSubtitleForEvents(subtitleName: "Chanukah: 4th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 5 Candles":
                            addSubtitleForEvents(subtitleName: "Chanukah: 5th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 6 Candles":
                            addSubtitleForEvents(subtitleName: "Chanukah: 6th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 7 Candles":
                            addSubtitleForEvents(subtitleName: "Chanukah: 7th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 8 Candles":
                            addSubtitleForEvents(subtitleName: "Chanukah: 8th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah 8 Weekday":
                            addSubtitleForEvents(subtitleName: "Chanukah: Ends at Sundown", event: sukkotAndChanukhaEvents)
                        default:
                            break
                        }
                    }
                }
            }
        }
    }
    
    func addSubtitleForEvents(subtitleName: String?, event: RLEvent?) {
        event?.subTitle = subtitleName
    }
}
