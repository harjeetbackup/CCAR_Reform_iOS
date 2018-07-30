import Foundation


enum CalendarType: Int {
    case israel = 0
    case dispora = 1
    case reform = 2
}

class CalendarSelectedType: NSObject {
    public var selectedCalender : CalendarType = .reform
    public var syncDataSources = [SyncDataSouce]()
    
//    override init() {
//        super.init()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init()
//        let state = aDecoder.decodeInteger(forKey:"selectedCalender")
//        self.selectedCalender = CalendarType.init(rawValue: state)!
//        self.syncDataSources = aDecoder.decodeObject(forKey: "syncDataSources") as! [SyncDataSouce]
//        for syncItems in self.syncDataSources {
//            syncItems.calendarType = self
//        }
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(selectedCalender.rawValue, forKey: "selectedCalender")
//        aCoder.encode(syncDataSources, forKey: "syncDataSources")
//    }
}


class SyncDataSouce: NSObject, NSCoding {
	public var year = String()
    public var syncTypes = [SyncType]()
    weak var calendarType: CalendarSelectedType?
    
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
