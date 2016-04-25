//
//	RootClass.swift
//
//	Create by sameh mabrouk on 23/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct EventsRootClass{

	var attributionHTML : String!
	var attributionText : String!
	var code : Int!
	var copyright : String!
	var data : EventsData!
	var etag : String!
	var status : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		attributionHTML = dictionary["attributionHTML"] as? String
		attributionText = dictionary["attributionText"] as? String
		code = (dictionary["code"] as? Int)
		copyright = dictionary["copyright"] as? String
		if let dataData = dictionary["data"] as? NSDictionary{
				data = EventsData(fromDictionary: dataData)
			}
		etag = dictionary["etag"] as? String
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
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