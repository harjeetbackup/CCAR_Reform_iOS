/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Leyning {
	public var day1 : String?
	public var day2 : String?
	public var day3 : String?
	public var day4 : String?
	public var day5 : String?
	public var day6 : String?
	public var day7 : String?
	public var torah : String?
	public var maftir : String?
	public var haftarah : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let leyning_list = Leyning.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Leyning Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Leyning]
    {
        var models:[Leyning] = []
        for item in array
        {
            models.append(Leyning(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let leyning = Leyning(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Leyning Instance.
*/
	required public init?(dictionary: NSDictionary) {

		day1 = dictionary["1"] as? String
		day2 = dictionary["2"] as? String
		day3 = dictionary["3"] as? String
		day4 = dictionary["4"] as? String
		day5 = dictionary["5"] as? String
		day6 = dictionary["6"] as? String
		day7 = dictionary["7"] as? String
		torah = dictionary["torah"] as? String
		maftir = dictionary["maftir"] as? String
		haftarah = dictionary["haftarah"] as? String
	}


}
