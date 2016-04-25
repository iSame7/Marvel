//
//	Price.swift
//
//	Create by sameh mabrouk on 21/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Price{

	var price : Int!
	var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		price = (dictionary["price"] as? NSString)?.integerValue
		type = dictionary["type"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if price != nil{
			dictionary["price"] = price
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}
}