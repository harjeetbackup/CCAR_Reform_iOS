
import Foundation

public class RLEvent {
	public var date : String?
	public var hebrew : String?
	public var category : String?
	public var link : String?
	public var leyning : Leyning?
	public var title : String?
    public var subTitle : String?
    public var spellChangedTitle : String?
    public var subcat : String?
    public var memo : String?
    public var yomtov = false

    public class func modelsFromDictionaryArray(array:NSArray) -> [RLEvent]
    {
        var models:[RLEvent] = []
        for item in array
        {
            let event = RLEvent(dictionary: item as! NSDictionary)!
            models.append(event)
        }

        return models
    }

	required public init?(dictionary: NSDictionary) {

		date = dictionary["date"] as? String
		hebrew = dictionary["hebrew"] as? String
		category = dictionary["category"] as? String
		link = dictionary["link"] as? String
		if (dictionary["leyning"] != nil) { leyning = Leyning(dictionary: dictionary["leyning"] as! NSDictionary) }
		title = dictionary["title"] as? String
        spellChangedTitle = title?.spellChangedForTitle()
        subcat = dictionary["subcat"] as? String
        memo = dictionary["memo"] as? String
        yomtov = dictionary["yomtov"] as? Bool ?? false
	}
    
    func isSpecialDayForSubTitle() -> Bool {
        if let str = self.spellChangedTitle {
            if (str == "Shabbat Parah" || str == "Shabbat Sh'kalim" || str == "Shabbat HaGadol" || str == "Shabbat Zachor" || str == "Shabbat HaChodesh" || str == "Shabbat Shuva" || str == "Shabbat Chanukah") {
                return true
            }
        }
        return false
    }
    
    func isComparableDayForSubTitle() -> Bool {
        if let str = self.spellChangedTitle {
            if (str.hasPrefix("Parashat") || str.hasPrefix("parashat")) {
                return true
            }
        }
        return false
    }
    
    
    func dayOfTheWeek() -> Int {
        if let eventDateStr = self.date {
            dateFormater.dateFormat = "yyyy-MM-dd"
            if let eventDate = dateFormater.date(from: eventDateStr) {
                if let nextWeekDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 7, to: eventDate) {
                    
                    if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian) {
                        let weekday = gregorianCalendar.component(.weekday, from: nextWeekDate)
                        return weekday
                    }
                }
            }
        }
        return 1
    }
    
    public func inSaturday() -> Bool {
        return self.dayOfTheWeek() == 7
    }
    
    public func inFriday() -> Bool {
        return self.dayOfTheWeek() == 6
    }
    
    public func eventDate() -> Date {
        if let eventDateStr = self.date {
            dateFormater.dateFormat = "yyyy-MM-dd"
            if let eventDate = dateFormater.date(from: eventDateStr) {
                return eventDate
            }
        }
        return Date()
    }
}
