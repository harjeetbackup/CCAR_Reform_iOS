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
                        var title1 = title
                        if (title == "Chanukah: 2nd Night" || title == "Chanukah: 3rd Night" || title == "Chanukah: 4th Night" || title == "Chanukah: 5th Night" || title == "Chanukah: 6th Night" || title == "Chanukah: 7th Night" || title == "Chanukah: 8th Night" || title == "Chanukah: 8th Day") {
                            title1 = "Shabbat Chanukah"
                        }
                        comparableEvent?.subTitle = "The Haftarah for \(title1) should be read."
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
                        var title1 = title
                        if (title == "Chanukah: 2nd Night" || title == "Chanukah: 3rd Night" || title == "Chanukah: 4th Night" || title == "Chanukah: 5th Night" || title == "Chanukah: 6th Night" || title == "Chanukah: 7th Night" || title == "Chanukah: 8th Night" || title == "Chanukah: 8th Day") {
                            title1 = "Shabbat Chanukah"
                        }
                        comparableEvent?.subTitle = "The Haftarah for \(title1) should be read."
                        specialEvent?.subTitle = ""
                        threeSpecialEvent?.subTitle = "The Haftarah for \(title1) should be read."
                        specialEvent = nil
                        comparableEvent = nil
                        threeSpecialEvent = nil
                    }
                }
            }
        }
    }
    
    func applySubtitleForsukkotAndChanukhaEvents(_ events:[RLEvent]) {
        var specialEvent : RLEvent?
        for event in events {
            if event.isSukkotAndChanukahSaturdayEventSpecialDayForSubTitle() {
                specialEvent = event
            }
            if let sukkotAndChanukhaEvents = specialEvent {
                if sukkotAndChanukhaEvents.inSaturday() || sukkotAndChanukhaEvents.inFriday() {
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
                        default:
                            break
                        }
                    }
                }
                if sukkotAndChanukhaEvents.inSaturday() {
                    if let title = sukkotAndChanukhaEvents.title?.spellChangedForTitle() {
                        switch title {
                        case "Chanukah: 2nd Night":
                            addSubtitleForEvents(subtitleName: "Chanukah: 2nd Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 3rd Night":
                            addSubtitleForEvents(subtitleName: "Chanukah: 3rd Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 4th Night":
                            addSubtitleForEvents(subtitleName: "Chanukah: 4th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 5th Night":
                            addSubtitleForEvents(subtitleName: "Chanukah: 5th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 6th Night":
                            addSubtitleForEvents(subtitleName: "Chanukah: 6th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 7th Night":
                            addSubtitleForEvents(subtitleName: "Chanukah: 7th Night", event: sukkotAndChanukhaEvents)
                        case "Chanukah: 8th Night":
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
    
    func applySaturdayFridayTitleChangeLogic(_ events:[RLEvent]) {
        for event in events {
            if let title = event.title {
                event.title = self.changeTitleName(event, eventTitle: title)
            }
        }
    }
    
    func changeTitleName(_ event: RLEvent,eventTitle: String ) -> String {
        var title = eventTitle
        //Spell changed for title is not applied here checking the events title directly coming from server
        if event.inSaturday() {
            title = title.replacingOccurrences(of: "Shavuot I", with: "Shavuot Shabbat")
            title = title.replacingOccurrences(of: "Sukkot I", with: "Sukkot 1 Shabbat")
            title = title.replacingOccurrences(of: "Shmini Atzeret", with: "Sh'mini Atzeret-Simchat Torah Shabbat")
            title = title.replacingOccurrences(of: "Rosh Chodesh I Weekday", with: "Shabbat Rosh Chodesh I")
            title = title.replacingOccurrences(of: "Rosh Chodesh II or One Day Rosh Chodesh Weekday", with: "Shabbat Rosh Chodesh II or One Day Rosh Chodesh")
            if title == "Pesach I" {
                title = title.replacingOccurrences(of: "Pesach I", with: "Pesach Day 1 Shabbat")
            }
            if title == "Pesach VII" {
                title = title.replacingOccurrences(of: "Pesach VII", with: "Pesach Day 7 Shabbat")
            }
            if (title == "Sukkot II (CH''M)" || title == "Sukkot III (CH''M)" || title == "Sukkot IV (CH''M)" || title == "Sukkot V (CH''M)" || title == "Sukkot VI (CH''M)") {
                title = "Chol Hamoed Sukkot Shabbat"
            }
            if (title == "Chanukah: 2 Candles" || title == "Chanukah: 3 Candles" || title == "Chanukah: 4 Candles" || title == "Chanukah: 5 Candles" || title == "Chanukah: 6 Candles" || title == "Chanukah: 7 Candles" || title == "Chanukah: 8 Candles" || title == "Chanukah: 8th Day") {
                title = "Shabbat Chanukah"
            }
        } else if event.inFriday() {
            title = title.replacingOccurrences(of: "Erev Pesach", with: "Erev Pesach Friday")
            title = title.replacingOccurrences(of: "Erev Rosh Chodesh Weekday", with: "Erev Rosh Chodesh Friday")
            //Anywhere Erev Sh'mini Atzeret/Simchat Torah is not coming only Sh'mini Atzeret/Simchat Torah is their
            title = title.replacingOccurrences(of: "Erev Sh'mini Atzeret/Simchat Torah", with: "Erev Sh'mini Atzeret/Erev Simchat Torah Friday")
            title = title.replacingOccurrences(of: "Erev Shavuot", with: "Erev Shavuot Friday")
            title = title.replacingOccurrences(of: "Erev Sukkot", with: "Erev Sukkot Friday")
            title = title.replacingOccurrences(of: "Erev Yom Kippur", with: "Erev Yom Kippur Friday")
            title = title.replacingOccurrences(of: "Erev Rosh Hashana", with: "Erev Rosh Hashana Friday")
            if title == "Pesach VI (CH''M)" {
                title = title.replacingOccurrences(of: "Pesach VI (CH''M)", with: "Pesach Chol HaMoed Day 5 Friday")
            }
            if (title == "Sukkot II (CH''M)" || title == "Sukkot III (CH''M)" || title == "Sukkot IV (CH''M)" || title == "Sukkot V (CH''M)" || title == "Sukkot VI (CH''M)") {
                title = "Shabbat Chol Hamoed Sukkot Friday"
            }
        }
        return title
    }
}
