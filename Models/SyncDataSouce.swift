import Foundation

enum SyncState: Int {
    case none = 0
    case completed = 1
    case progress = 2
}

class SyncType: NSObject, NSCoding {
    var syncState = SyncState.none
    var title = String()
    var category = String()
    var subCategory = String()
    weak var dataSource: SyncDataSouce?
    
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
    
    func eventToSync(selectedYears: [String], _ completion: @escaping(([RLEvent]) -> Void)) {
        guard let year = Int((dataSource?.year)!) else { return }
        EventManager.shared.fetchEvents( year: year,isFromEventsTab:false, yearSelectedForSync: selectedYears, { events in
           let itemsToAddInCalender = events.filter({ (event) -> Bool in
                print(event.category ?? "")
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
            completion(itemsToAddInCalender)
        })
    }
}

class SyncDataSouce: NSObject, NSCoding {
	public var year = String()
    public var syncTypes = [SyncType]()
    
     override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.year = aDecoder.decodeObject(forKey: "year") as! String
        self.syncTypes = aDecoder.decodeObject(forKey: "syncTypes") as! [SyncType]
        for type in self.syncTypes {
            type.dataSource = self
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(year, forKey: "year")
        aCoder.encode(syncTypes, forKey: "syncTypes")
    }
}
