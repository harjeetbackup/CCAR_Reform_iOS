//
//  SyncType.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 20/07/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation
import EventKit

enum SyncState: Int {
    case none = 0
    case completed = 1
    case selected = 2
    case inProgress = 3
}

class SyncType: NSObject, NSCoding {
    var syncState = SyncState.none
    var title = String()
    var category = String()
    var subCategory = String()
    weak var dataSource: SyncDataSouce?
    var eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    
    init(dict: [String:String], source: SyncDataSouce) {
        title = dict["title"] ?? ""
        category = dict["category"] ?? ""
        subCategory = dict["subCategory"] ?? ""
        dataSource = source
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.category = aDecoder.decodeObject(forKey: "category") as! String
        self.subCategory = aDecoder.decodeObject(forKey: "subCategory") as! String
        let state = aDecoder.decodeInteger(forKey:"syncState")
        self.syncState = SyncState.init(rawValue: state)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(category, forKey: "category")
        aCoder.encode(subCategory, forKey: "subCategory")
        aCoder.encode(syncState.rawValue, forKey: "syncState")
    }
    
    func sync(_ completion: @escaping((_ completed: Bool) -> Void)) {
        guard let year = Int((dataSource?.year)!) else { return }
        EventManager.shared.fetchEventsFor( year: year, { events in
            let itemsToAddInCalender = events.filter({ (event) -> Bool in
                let calendar = Calendar.current
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: event.date!)
                let eventYear = calendar.component(.year, from: date!)
                guard let cat = event.category, let subcat = event.subcat else { return false }
                print(eventYear)
                if self.subCategory == ""  && cat == self.category && eventYear == year {
                    return true
                } else if cat == self.category && subcat == self.subCategory && eventYear == year {
                    return true
                }
                return false
            })
            self.syncWithCalender(itemsToAddInCalender, completion: completion)
        })
    }
    
    private func syncWithCalender(_ itemsToAddInCalender: [RLEvent], completion: @escaping((_ completed: Bool) -> Void)) {
        var txtStartDate = String()
        var txtEventName = String()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var strGetEventTitle = String()
        var strGetEventDate = Date()
        DispatchQueue.global(qos: .background).async {
            for dicc in itemsToAddInCalender {
                txtEventName = dicc.title ?? ""
                txtStartDate = dicc.date ?? ""
                txtEventName = txtEventName.spellChangedForTitle()
                guard let datevalue = dateFormatter.date(from: txtStartDate),
                    let datevalue1 = dateFormatter.date(from: txtStartDate) else {
                        continue
                }
                let predicate = self.eventStore.predicateForEvents(withStart: datevalue, end: datevalue1, calendars: self.calendars)
                let events = self.eventStore.events(matching: predicate) as [EKEvent]
                print("Events: \(events)")
                for event in events
                {   event.isAllDay = true
                    strGetEventTitle = event.title;
                    strGetEventDate = event.startDate;
                }
                if strGetEventTitle == "txtEventName" && strGetEventDate == datevalue {
                } else {
                    let event:EKEvent = EKEvent(eventStore: self.eventStore)
                    event.title = txtEventName
                    event.isAllDay = true
                    event.startDate = datevalue
                    event.endDate = datevalue1
                    if let description = dicc.memo {
                        event.notes = description
                    }
                    event.calendar = self.eventStore.defaultCalendarForNewEvents
                    do {
                        try self.eventStore.save(event, span: .thisEvent)
                    }
                    catch let e as NSError
                    {
                        print("calendar sync error")
                        print(e.description)
                        completion(false)
                        return
                    }
                }
            }
            DispatchQueue.main.async {
                self.syncState = .completed
                completion(true)
            }
        }
    }
}

