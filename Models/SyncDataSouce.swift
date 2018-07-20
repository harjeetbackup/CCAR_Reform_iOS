import Foundation

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
