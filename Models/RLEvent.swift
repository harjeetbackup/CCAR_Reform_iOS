
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
        var specialEvent: RLEvent?
        for item in array
        {
            let event = RLEvent(dictionary: item as! NSDictionary)!
            
            if isSpecialDay(event: event) == true {
                specialEvent = event // Wait for next.
            } else if isComparableDay(event: event) == true {
                if let str = specialEvent?.spellChangedTitle {
                    event.subTitle = "* The Haftarah for \(str) should be read."
                }
            }
            
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
    
    private class func isSpecialDay(event: RLEvent) -> Bool {
        if let str = event.spellChangedTitle {
            if (str == "Shabbat Parah" || str == "Shabbat Sh'kalim" || str == "Shabbat Hagadol" || str == "Shabbat Zachor" || str == "Shabbat Hachodesh") {
                return true
            }
        }
        return false
    }
    
    private class func isComparableDay(event: RLEvent) -> Bool {
        if let str = event.spellChangedTitle {
            if (str.hasPrefix("Parashat") || str.hasPrefix("parashat")) {
                return true
            }
        }
        return false
    }


}
