//
//	RootClass.swift
//
//	Create by sameh mabrouk on 21/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

class ComicRootClass: BaseRootClass{

	var data : ComicData!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        super.init()
		self.attributionHTML = dictionary["attributionHTML"] as? String
		self.attributionText = dictionary["attributionText"] as? String
		self.code = (dictionary["code"] as? NSString)?.integerValue
		self.copyright = dictionary["copyright"] as? String
		if let dataData = dictionary["data"] as? NSDictionary{
				data = ComicData(fromDictionary: dataData)
			}
		self.etag = dictionary["etag"] as? String
		self.status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if attributionHTML != nil{
			dictionary["attributionHTML"] = attributionHTML
		}
		if attributionText != nil{
			dictionary["attributionText"] = attributionText
		}
		if code != nil{
			dictionary["code"] = code
		}
		if copyright != nil{
			dictionary["copyright"] = copyright
		}
		if data != nil{
			dictionary["data"] = data.toDictionary()
		}
		if etag != nil{
			dictionary["etag"] = etag
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

}