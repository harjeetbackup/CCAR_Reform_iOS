//
//  EventManager+ReformLogic.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 14/04/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

let dateFormater = DateFormatter()

extension EventManager {
    
    func applyReformLogic(events: [RLEvent]) -> [RLEvent] {
//        var reformEvents = events
//        let ev = RLEvent.init(dictionary: NSDictionary())
//        ev?.title = "Prabhu"
//        reformEvents.insert(ev!, at: 1)
        
        var pesachEvent: RLEvent? = nil
        var nextWeekDateStr: String? = nil
        // ------------ Loop ---------------
        for ev in events {
            if let title = ev.title, title == "Pesach VIII" && ev.yomtov == true {
                pesachEvent = ev
                if let eventDateStr = ev.date {
                    dateFormater.dateFormat = "yyyy-MM-dd"
                    if let eventDate = dateFormater.date(from: eventDateStr) {
                        if let nextWeekDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 7, to: eventDate) {
                            nextWeekDateStr = dateFormater.string(from: nextWeekDate)
                        }
                    }
                }
            }
            // Next level Check:
            
            guard let title = ev.title, title == "Parashat Shmini",
                let ed = ev.date, let dateToComaper = nextWeekDateStr,
                ed == dateToComaper, let pEvent = pesachEvent else { continue }
            
                pEvent.title = "Parashat Shmini"
                ev.title = "Parashat Shmini II"
            
        }
        //------------ Loop End ---------------
        return events
    }
}


