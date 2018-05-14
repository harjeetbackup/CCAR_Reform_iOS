
import Foundation

public class RLEvent {
	public var date : String?
	public var hebrew : String?
	public var category : String?
	public var link : String?
	public var leyning : Leyning?
	public var title : String?
    public var spellChangedTitle : String?
    public var subcat : String?
    public var memo : String?
    public var yomtov = false


    public class func modelsFromDictionaryArray(array:NSArray) -> [RLEvent]
    {
        var models:[RLEvent] = []
        for item in array
        {
            models.append(RLEvent(dictionary: item as! NSDictionary)!)
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

}
