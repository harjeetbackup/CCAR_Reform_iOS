import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class CalendarSyncEvent {
	public var year : String?
	public var major_holidays : String?
	public var minor_holidays : String?
	public var rosh_chodesh : String?
	public var weekly_parshiyot : String?
	public var sefirat_haOmer : String?
	public var special_shabbatot : String?
	public var modern_holidays : String?

    public class func modelsFromDictionaryArray(array:NSArray) -> [CalendarSyncEvent]
    {
        var models:[CalendarSyncEvent] = []
        for item in array
        {
            models.append(CalendarSyncEvent(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		year = dictionary["year"] as? String
		major_holidays = dictionary["major_holidays"] as? String
		minor_holidays = dictionary["minor_holidays"] as? String
		rosh_chodesh = dictionary["rosh_chodesh"] as? String
		weekly_parshiyot = dictionary["weekly_parshiyot"] as? String
		sefirat_haOmer = dictionary["sefirat_haOmer"] as? String
		special_shabbatot = dictionary["special_shabbatot"] as? String
		modern_holidays = dictionary["modern_holidays"] as? String
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.year, forKey: "year")
		dictionary.setValue(self.major_holidays, forKey: "major_holidays")
		dictionary.setValue(self.minor_holidays, forKey: "minor_holidays")
		dictionary.setValue(self.rosh_chodesh, forKey: "rosh_chodesh")
		dictionary.setValue(self.weekly_parshiyot, forKey: "weekly_parshiyot")
		dictionary.setValue(self.sefirat_haOmer, forKey: "sefirat_haOmer")
		dictionary.setValue(self.special_shabbatot, forKey: "special_shabbatot")
		dictionary.setValue(self.modern_holidays, forKey: "modern_holidays")

		return dictionary
	}

}
