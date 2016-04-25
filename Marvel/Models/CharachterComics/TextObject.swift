//
//	TextObject.swift
//
//	Create by sameh mabrouk on 21/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct TextObject{

	var language : String!
	var text : String!
	var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		language = dictionary["language"] as? String
		text = dictionary["text"] as? String
		type = dictionary["type"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if language != nil{
			dictionary["language"] = language
		}
		if text != nil{
			dictionary["text"] = text
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

}